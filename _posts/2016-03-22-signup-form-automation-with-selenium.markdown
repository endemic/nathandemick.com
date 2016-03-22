---
layout: post
status: publish
published: true
title: Signup form automation with Selenium
author:
  display_name: Nathan
  email: ndemick@gmail.com
date: 2016-03-22 11:49:41 -0400
categories:
- tutorial
- programming
tags:
- ruby
- web
- selenium
comments: []
---
For a recent project, I was tasked with creating a large number of user accounts
on various 3rd party websites. Specifically, Spotify, Last.fm, and Basis. I started
off by doing the ol' copypasta, but after about the third Spotify account, I realized
that I was going to go brain dead before finishing them all. Then I remembered
[Selenium](http://docs.seleniumhq.org/). I had my list of proposed usernames, email
addresses, and passwords -- why couldn't I just feed those into an automated browser
instance?

Well, the answer is, of course, that I could -- with varying degrees of success.
For most account-based websites, the general steps you'll take to create a bunch
of accounts is as follows:

1. Go to signup page
2. Enter user data
3. Submit form
4. Log out

Spotify was the easiest of the three to automate. Their signup form is very basic,
with (surprisingly) no CAPTCHA or email validation. The only problem is that
when you successfully submit the form, the resulting page automatically prompts
a desktop client download. I wasn't able to quickly find a way to dismiss that,
so simply paused my script so that I could manually click "cancel." Much easier
than filling out the form.

<pre><code class="language-ruby">
require "selenium-webdriver"
driver = Selenium::WebDriver.for :firefox

accounts = [
  # account info redacted...
]

accounts.each do |account|
  driver.navigate.to "https://www.spotify.com/us/signup/"

  driver.find_element(:name, 'username').send_keys(account[:username])
  driver.find_element(:name, 'password').send_keys(account[:password])
  driver.find_element(:name, 'email').send_keys(account[:email])
  driver.find_element(:name, 'confirm_email').send_keys(account[:email])

  driver.find_element(:name, 'dob_month').send_keys(months[(0..11).to_a.sample])
  driver.find_element(:name, 'dob_day').send_keys((1..28).to_a.sample)
  driver.find_element(:name, 'dob_year').send_keys((1950..2000).to_a.sample)
  driver.find_element(:id, 'register-male').click

  driver.find_element(:id, 'register-button-email-submit').click

  # Enough time to manually dismiss client download prompt
  sleep 5

  driver.navigate.to "https://www.spotify.com/us/logout"
end
</code></pre>

Last.fm was a bit tricker, as they include a [reCAPTCHA](https://en.wikipedia.org/wiki/ReCAPTCHA) widget in their form.
While modern versions of reCAPTCHA look like just a simple checkbox, there is
obviously some complex logic going on behind the scenes. As a human, you click
their "I am not a robot" checkbox and you're done. When a script fills out
the form and clicks the checkbox element, the checkbox is checked, but an
image recognition CAPTCHA is presented. Rather than try to figure out the logic
behind triggering the additional level of protection, I simply stopped my script
after loading the challenge, and manually clicked through. It was kind of fun,
actually, to see the different queries and how fast I could complete them.
I suspect the CAPTCHA is triggered by the absense of human-like activities
(i.e. normal JavaScript events that would be triggered by a human, like mouseover),
but didn't feel like figuring it out, because I'm lazy.

<pre><code class="language-ruby">
require "selenium-webdriver"
require "pry"
driver = Selenium::WebDriver.for :firefox

accounts = [
  # account info redacted...
]

accounts.each do |account|
  driver.navigate.to "https://secure.last.fm/join"

  driver.find_element(:name, 'userName').send_keys(account[:username])
  driver.find_element(:name, 'email').send_keys(account[:email])
  driver.find_element(:name, 'password').send_keys(account[:password])
  driver.find_element(:name, 'passwordConf').send_keys(account[:password])
  driver.find_element(:id, 'id_terms').click

  captcha_iframe = driver.find_element(:css, 'iframe[title="recaptcha widget"]')
  driver.switch_to.frame(captcha_iframe)
  captcha_checkbox = driver.find_element(:id, 'recaptcha-anchor')
  driver.action.move_to(captcha_checkbox).click(captcha_checkbox).perform

  # switch back to the main document
  driver.switch_to.default_content

  # Wait until Control+D from user to continue
  binding.pry
end
</code></pre>

Basis was the most annoying form to fill out. It's some sort of terrible SPA,
so you have to wait until the DOM content loads before filling in any data.
It also has some sort of weird logic that requires each input to be tabbed into,
or else it thinks the POST fails when the form is submitted (it's not, actually).
You can also tell it's some horrible JavaScript form because some input elements
don't actually have `name` attributes, which also makes them terribly annoying
to find/fill out. I ended up enumerating over all the input elements, then trying
to differentiate based on a `data-bound-to` property. The problem was that multiple
elements had the same `data-bound-to` value, so I had to ignore any subsequent
elements after the first. This form also asks for a lot more data (name, height, weight, etc.)
that I had to generate. That's why I love Ruby's `Array#sample` method.

<pre><code class="language-ruby">
require "selenium-webdriver"
require "pry"
driver = Selenium::WebDriver.for :firefox

accounts = [
  # account info redacted...
]

accounts.each do |account|
  driver.navigate.to "https://app.mybasis.com/#register"

  # It's a stupid Javascript app, so wait until the DOM elements load
  wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds
  wait.until { driver.find_element(:name, 'email') }

  # Email
  driver.find_element(:name, 'email').send_keys(account[:email])
  driver.find_element(:name, 'confirm_email').send_keys(account[:email])

  # Password
  driver.find_element(:name, 'password').send_keys(account[:password])
  driver.find_element(:name, 'confirm_password').send_keys(account[:password])

  # Birthday
  birthday = "#{(1..12).to_a.sample.to_s.rjust(2, "0")}/#{(1..28).to_a.sample.to_s.rjust(2, "0")}/#{(1970..2000).to_a.sample}"
  driver.find_element(:name, 'anatomy.dob').send_keys(birthday)

  # Gender
  driver.find_element(:name, 'gender').click

  # Timezone
  driver.find_element(:name, 'settings.timezone').send_keys("(GMT-04:00) New York")

  # Find elements that don't have any sort of queryable attribute
  height_counter = 0
  weight_counter = 0
  elements = driver.find_elements(:css, 'input')
  elements.each do |elem|
    case elem.attribute('data-bound-to')
    when 'n:profile.first_name'
      elem.send_keys(%w(James John Robert Michael William Mary Patricia Linda Barbera Elizabeth).sample)
    when 'n:profile.last_name'
      elem.send_keys(%w(Smith Doe Brown Jones Johnson Miller Davis Wilson Anderson Taylor).sample)
    when 'n:anatomy.height'
      if height_counter == 2
        next
      elsif height_counter == 1
        elem.send_keys((0..11).to_a.sample)
      else
        elem.send_keys((4..6).to_a.sample)
      end
      height_counter += 1
    when 'n:anatomy.weight'
      if weight_counter == 1
        next
      else
        elem.send_keys((110..180).to_a.sample)
      end
      weight_counter += 1
    end
  end

  # Manually submit form, then log out
  binding.pry
end
</code></pre>

I'll probably never have to do anything similar in the near future, but hopefully
these examples will help you out if you have a similar (mind-numbing) task in your future.
