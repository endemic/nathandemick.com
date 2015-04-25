---
layout: post
status: publish
published: true
title: iOS internationalization and localization
author:
  display_name: nathan
  login: nathan
  email: ndemick@gmail.com
  url: ''
author_login: nathan
author_email: ndemick@gmail.com
wordpress_id: 395
wordpress_url: http://ganbarugames.com/?p=395
date: '2011-08-25 15:05:03 -0400'
date_gmt: '2011-08-25 19:05:03 -0400'
categories:
- Tutorial
tags:
- tutorial
- xocde
- internationalization
- i18n
- localization
- japanese
comments:
- id: 48
  author: 1923coupe
  author_email: 1923coupe@gmail.com
  author_url: ''
  date: '2011-09-02 09:02:00 -0400'
  date_gmt: '2011-09-02 09:02:00 -0400'
  content: Nathan, First of all I would like to thank you for the informative tutorials
    you share with us.  Second, I live in Japan and can help with any current or  future
    localization projects you may have.  I may also be asking you for help with my
    own projects as i am still new to cocos2d and XCode.
- id: 49
  author: Nathan
  author_email: ndemick@gmail.com
  author_url: http://ganbarugames.com
  date: '2011-09-02 13:19:00 -0400'
  date_gmt: '2011-09-02 13:19:00 -0400'
  content: |-
    Hey, thanks for the offer.  I might take you up on it if I get in too deep over my head... I stopped studying Japanese probably 6 years ago, so I'm pretty rusty!

    Yeah, if you have any questions, don't hesitate to ask. I'm by no means an expert, but slowly working my way to being more knowledgable about cocos2d and game programming.
- id: 50
  author: 1923coupe
  author_email: 1923coupe@gmail.com
  author_url: ''
  date: '2011-09-02 14:54:00 -0400'
  date_gmt: '2011-09-02 14:54:00 -0400'
  content: 'Maybe not an expert now, but we all have to start somewhere.  Your well
    on your way.  What I really like about your tutorials is the amount of detail
    (comments) you put in the source code.  Very few people do that, much less do
    it well.  Your source code alone is a complete tutorial.  Keep it up, great work!!! '
- id: 51
  author: 1923coupe
  author_email: 1923coupe@gmail.com
  author_url: ''
  date: '2011-09-02 14:58:00 -0400'
  date_gmt: '2011-09-02 14:58:00 -0400'
  content: Oops, posted another comment rather than replied. I need to work on my
    attention to detail.
- id: 81
  author: bd
  author_email: bdehaene80@hotmail.com
  author_url: ''
  date: '2012-01-19 06:11:00 -0500'
  date_gmt: '2012-01-19 11:11:00 -0500'
  content: Thanks a lot !
- id: 122
  author: Andrew Bukowski
  author_email: andrewbukowski@ymail.com
  author_url: ''
  date: '2013-06-25 10:43:00 -0400'
  date_gmt: '2013-06-25 14:43:00 -0400'
  content: 'Here is a very good online localization software that works really nice
    with strings: https://poeditor.com/. I recommend it to all translators, it makes
    things a lot easier.'
---
<p>Something I wanted to do for the release of color+shape was try to have a Japanese localization. I know a smattering of Japanese, and I figured it was a relatively small effort to double my App Store keywords. Actually, I think you can have multilingual app listings without doing any localization, but I also wanted to learn about internationalization (hereafter, "i18n") in Xcode projects.</p>
<p>color+shape doesn't have a lot of text in it; in fact, most of the text in the game is embedded in .png files. This actually means that localization is a lot more work, because I have to actually create two different versions of each image with text: one with English, the other with Japanese. However, that might have been my only option... I have no idea if cocos2d-iphone's bitmap label classes support non-Latin characters. Perhaps I'll try that experiment sometime in the future.</p>
<p>However, even though it's lots of work to create multiple image files, it's pretty easy to get them into Xcode (version 4, by the way). I'll outline the steps here.</p>
<ol>
<li>Save out the image you want to display in multiple languages, and add it to Xcode in the normal way (right-click on the Project Navigator file hierarchy, click "Add Files to [your project name]", then choose the image.</li>
<li>Highlight the newly-added image, then click the button in the upper right that shows the "Utilities" toolbar (it'll be the one that pops out from the right).</li>
<li>There'll be a "Localization" section in that toolbar for each resource file. By default, of course, there will be no localizations. Click the "+" button at the bottom of the blank list. It'll deselect the image you selected, so re-select the image file.</li>
<li>When you re-select the image, you'll see that an "English" localization has been created. What that means is that behind the scenes, a new directory called "en.lproj" has been created in your Resources directory, and the image has been moved there. Click the "+" button again to create as many different localizations as you want. Each time you do so, a new directory will be created with a copy of the original file.</li>
<li>To finish, simply create a translated version of the image, and save it into the appropriate localized directory, using the same filename (for example, if I wanted to have a localized title screen image, "title.png", I'd follow the steps outlined above, then save my Japanese version in "Resources/ja.lproj/title.png").</li>
<li>To make sure everything is working, open up your iOS simulator (or device) and change the language setting under "General > International" in the Settings app. Build and run your app, and you should see the translated resource get used automatically &mdash; you don't have to change anything in your code! It's worth noting, however, that you want to make sure your translated images are the same dimensions, otherwise their positions might be incorrect.</li>
</ol>
<p>I'll also tell you how to localize the display name of your app. This actually took me a lot of trial and error to figure out, since most of the online documentation and tutorials I found left out a critical step (the necessity of semicolons at the end of each line).</p>
<ol>
<li>Add "Application has localized display name" key to Info.plist</li>
<li>Add a new file to your project named "InfoPlist.strings" (under the "Resources" category in the New File dialog)</li>
<li>Add localizations to that file, using the same process detailed above</li>
<li>Add this line to each localization "CFBundleDisplayName" = "LocalizedName";</li>
</ol>
<p>If you get this error: "validation failed: The data couldn’t be read because it has been corrupted." that means there needs to be a semicolon at the end of each line in your InfoPlist.strings file.</p>
<p>Hopefully this gives you a starting point for translating and building a localized version of your game or app. I'll be sure to write again about whether or not this has an effect on my downloads in Japan.</p>
