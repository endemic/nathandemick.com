---
layout: post
status: publish
published: true
title: Progressive enhancement
author:
  display_name: Nathan
  login: admin
  email: ndemick@gmail.com
  url: ''
author_login: admin
author_email: ndemick@gmail.com
wordpress_id: 144
wordpress_url: http://www.bitter-gamer.com/?p=144
date: '2008-11-17 08:19:11 -0500'
date_gmt: '2008-11-17 13:19:11 -0500'
categories:
- games
- programming
tags:
- programming
- Flash
- games
comments: []
---
<p><a href="http://www.bitter-gamer.com/files/Game.swf" title="Moving ship">Weekend progress</a></p>
<p>Obviously, getting from displaying a keyboard-controlled object to a more "game-like" state is pretty easy. Here I've loaded an external PNG (that represents a spaceship of some kind) and attached it to a "ship" class instance. The left/right arrow keys control the object's internal "rotation" value, and pressing the up arrow key moves the ship. The direction is determined by trigonometry functions; the movement vector along the x-axis is cos(ship.rotation) and the y-axis movement vector is sin(ship.rotation). (For example, if our ship is pointing straight up (90&deg;), cos(90)=0 and sin(90)=1, so it'll move straight up.)</p>
