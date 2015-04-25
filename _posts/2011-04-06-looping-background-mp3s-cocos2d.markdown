---
layout: post
status: publish
published: true
title: Looping background MP3s with cocos2d
author:
  display_name: nathan
  login: nathan
  email: ndemick@gmail.com
  url: ''
author_login: nathan
author_email: ndemick@gmail.com
wordpress_id: 315
wordpress_url: http://ganbarugames.com/?p=315
date: '2011-04-06 18:01:47 -0400'
date_gmt: '2011-04-06 22:01:47 -0400'
categories:
- Tutorial
tags: []
comments: []
---
<p>OK, so I had a minor crisis today as I realized that the music that I made with pxTone and encoded with Audacity was not looping correctly in cocos2d. Even though I carefully cropped my source .wav files, after converting them to .mp3 and loading them into my game, there would be about a half-second delay before the BGM would loop. Turns out that this is due to the way most MP3 encoders handle the format; they add extra padding to the beginning and end of the file.</p>
<p>I came across a forum post where the author of CocosDenshion linked to a post that explained the problem, but didn't offer a solution. I tried to use the utility he referenced, but couldn't get it to work. Then I tried to think why I hadn't run into this problem before. I realized that for Nonogram Madness, I made all my music with GarageBand. On a whim, I loaded my exported .wav into a new GarageBand project, then exported to MP3. It worked perfectly! There are a number of great things about this solution. First, GarageBand is included free with Macintosh computers, and you can get new versions for $5 from the Mac App Store. Second, I don't have to use Audacity, which I have not been a fan of so far. </p>
