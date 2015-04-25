---
layout: post
status: publish
published: true
title: Shikaku Madness on the Mac App Store
author:
  display_name: nathan
  login: nathan
  email: ndemick@gmail.com
  url: ''
author_login: nathan
author_email: ndemick@gmail.com
wordpress_id: 547
wordpress_url: http://ganbarugames.com/?p=547
date: '2012-07-23 17:35:02 -0400'
date_gmt: '2012-07-23 21:35:02 -0400'
categories:
- Games
tags:
- objective-c
- shikaku madness
- mac app store
- os x
comments: []
---
<p>Just a quick note to say that I ponied up the $100 to publish apps on the Mac App Store, and dropped a copy of <a href="http://shikaku.ganbarugames.com" title="Shikaku Madness">Shikaku Madness</a> in there. It's part of my experiment to port "HTML5" games to as many platforms as I possibly can. I was inspired by Lost Decade Games, who wrote up a basic tutorial about <a href="http://www.lostdecadegames.com/an-html5-game-in-the-mac-app-store/">embedding a Javascript app into a Cocoa WebView</a>. Unfortunately, their tutorial is slightly out of date, so I spent a bit of time struggling to find a way around some annoying issues. One of the weird quirks of the WebView is that it doesn't persist localStorage by default, and there is apparently no way to enable it without resorting to a private API call (which we all know, are the devil). The app was approved, though, which I guess means that particular call can slide under the radar. When I have more time, I'd like to learn more about writing an Objective-C/Javascript bridge (this is something that's officially supported; it's how Cordova/PhoneGap plugins are able to work) to implement in-app purchase.</p>
<p>I probably wasted a bit of time fussing around with creating my own custom project. However, the <a href="https://github.com/apache/incubator-cordova-mac">OS X Cordova port</a> is pretty bare bones at this point, which is why I didn't use it. Maybe a better choice would have been to try <a href="https://github.com/maccman/macgap">MacGap</a>?</p>
<p>In any case, if you haven't yet, you can check out <a href="http://itunes.apple.com/us/app/shikaku-madness/id542363256">Shikaku Madness in the Mac App Store</a>.</p>
