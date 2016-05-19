---
layout: post
status: publish
published: true
title: Self-Hosted Comments for a Static Blog
author:
  display_name: Nathan
  email: ndemick@gmail.com
date: 2016-05-19 12:53:20 -0400
categories:
- programming
tags:
- ruby
- comments
comments: []
---
Last year, when I ditched my managed hosting, I converted my blog to use Jekyll,
a static site generator. At the time I was pretty overwhelmed with all the tasks
necessary to move my digital life, and didn't want to throw "configure PHP/MySQL"
onto the pile. Also, much to my chagrin, when I looked over my Wordpress installation
prior to exporting its content, I noticed a bunch of suspicious-looking files
that could only have been created by script kiddies exploiting Wordpress vulnerabilities.
I thought I had been pretty concientious in keeping my instance up to date, but
apparently not. So a static site it was.

One of the downsides to a static site is that... it's static. No comments or
any other form of interactivity. At first I tried hooking up Disqus, which
I had actually also used in my Wordpress blog, rather than the native comments.
Problem is, I dislike Disqus. As with any free service, if you aren't paying,
then _you_ are the product. Managing a Disqus account is annoying, and it's yet
another 3rd party service that gets to track you around the web. So, during a
bit of downtime, I created my own basic [blog comments app](https://github.com/endemic/self_hosted_comments/).

It's a Ruby app written with Sinatra that has two routes: GET and POST. Comments
are stored in a SQLite database (I'm not anticipating heavy traffic). Include the
client-side script wherever you want your comments to appear in a post. It uses
[reCAPTCHA](https://developers.google.com/recaptcha/) for abuse prevention.

I learned a few things doing this project, including how to use [nginx](http://nginx.org/en/) as a reverse
proxy (only used Apache before), create an [Upstart](http://upstart.ubuntu.com/) init script (sigh), and
deploy a basic Ruby app on a [VPS](https://m.do.co/c/572fd3127dc4). It's amazing how much of this stuff you don't
have to do when working at a company with sysadmin folks XD.

It should be fairly easy for anyone to take this code, made a few minor modifications,
and run it for their own blog. I would also be happy to answer any questions
about getting it up and running... just leave me a comment!
