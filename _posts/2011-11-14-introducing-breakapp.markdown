---
layout: post
status: publish
published: true
title: Introducing BreakApp
author:
  display_name: nathan
  login: nathan
  email: ndemick@gmail.com
  url: ''
author_login: nathan
author_email: ndemick@gmail.com
wordpress_id: 437
wordpress_url: http://ganbarugames.com/?p=437
date: '2011-11-14 16:45:28 -0500'
date_gmt: '2011-11-14 21:45:28 -0500'
categories:
- Productivity
tags:
- cocos2d
- app store
- breakapp
comments:
- id: 70
  author: D Xl Mccormack
  author_email: d.xl.mccormack@gmail.com
  author_url: ''
  date: '2011-11-23 12:06:00 -0500'
  date_gmt: '2011-11-23 17:06:00 -0500'
  content: I love the app for the beautiful clock and straightforward interface, however
    for us timeboxers out there I'd like the ability to set up 2-10 minute time periods.
    This Is  possible right?
- id: 71
  author: Nathan
  author_email: ndemick@gmail.com
  author_url: http://ganbarugames.com
  date: '2011-11-23 17:13:00 -0500'
  date_gmt: '2011-11-23 22:13:00 -0500'
  content: The minimum "work" time you can set is 30 minutes. I'll update the app
    description with that limitation so people who want shorter limits can find a
    different app.
- id: 72
  author: D Xl Mccormack
  author_email: d.xl.mccormack@gmail.com
  author_url: ''
  date: '2011-11-24 10:30:00 -0500'
  date_gmt: '2011-11-24 15:30:00 -0500'
  content: 'Ok that''s a shame... Thank you for what you''ve done with this app already. '
- id: 76
  author: sb
  author_email: go_blossom@hotmail.com
  author_url: ''
  date: '2011-12-09 18:26:00 -0500'
  date_gmt: '2011-12-09 23:26:00 -0500'
  content: love it!!!
- id: 125
  author: Roman
  author_email: mysubscriptionbox@yahoo.com
  author_url: ''
  date: '2014-01-28 02:03:00 -0500'
  date_gmt: '2014-01-28 07:03:00 -0500'
  content: "Dear Nathan, I somehow have troubles with switching the app off. \nI seem
    to be no longer able to keep up with the rhythm the app insists on, so have either
    to find a way to turn it off or simply delete it. The latter is of course highly
    undesirable since your creation\ndoes looks great... "
- id: 129
  author: Nathan
  author_email: ndemick@gmail.com
  author_url: http://ganbarugames.com
  date: '2014-02-05 16:51:00 -0500'
  date_gmt: '2014-02-05 21:51:00 -0500'
  content: |-
    The way the app currently works is a bit weird. Basically once you set a "break" interval, it'll keep notifying you on that interval until you turn the "Display Notifications" option to "off." Then you can update the interval and turn it back on.

    If I ever find time to update the app, I'll probably change it so that will only send a notification once, and then require that you set it up again. That way users won't be surprised with multiple notifications or be confused as to how to turn the notifications off.
---
<p><a href="http://ganbarugames.com/wp-content/uploads/2011/11/breakapp-back.png"><img src="http://ganbarugames.com/wp-content/uploads/2011/11/breakapp-back-200x300.png" alt="" title="BreakApp (settings)" width="133" height="200" class="alignright size-medium wp-image-438" /></a>Despite the relative silence of the blog recently, I've still been programming. After updating Nonogram Madness and Revolve Ball, I wanted to do something new, so decided to make a small productivity app. The result is BreakApp, a simple application for iPhone and iPod Touch which tries to remind you to take breaks from sitting at your desk. Most of my life is spent sitting, sadly, and there seems to be lots of research that says that prolonged sitting will take years off your life. However, if you can get up and move around regularly, it can help offset the negative effects of being a desk jockey.</p>
<p>Such "take a break" apps exist for the desktop already, but I wanted to make something for my phone. It's all too easy for me to ignore warnings on my desktop, but when I get a notification on my phone, it breaks my flow/concentration more, because I have to spend more effort to look at the phone's screen. Plus, I figured I'd be more likely to actually use the app if I was the one who wrote it.</p>
<p><a href="http://ganbarugames.com/wp-content/uploads/2011/11/breakapp-front.png"><img src="http://ganbarugames.com/wp-content/uploads/2011/11/breakapp-front-200x300.png" alt="" title="BreakApp (front)" width="133" height="200" class="alignleft size-medium wp-image-439" /></a>The app is still written with cocos2d. I toyed with the idea of learning Interface Builder, but decided to prototype with something I already knew. By the time the functionality of the app was done, I had little interest in going back and re-writing the display code. The only real downside of using cocos2d instead of UIKit was the jankiness of the "slider" controls. I used some freely available code front the <a href="https://github.com/cocos2d/cocos2d-iphone-extensions" title="cocos2d-extensions porject">cocos2d-extensions project,</a> and while it works, it's not as good as what Apple provides. </p>
<p>I published the app as a way to make it more permanent, not necessarily to make any money. You can <a href="http://itunes.apple.com/us/app/breakapp/id477125110?mt=8" title="check it out on iTunes">check it out on iTunes</a>, and if it seems like the sort of thing you'd use, send me a note and I'll give you a promo code.</p>
