---
layout: post
status: publish
published: true
title: Vector vs. bitmap graphics in Flash
author:
  display_name: Nathan
  login: admin
  email: ndemick@gmail.com
  url: ''
author_login: admin
author_email: ndemick@gmail.com
wordpress_id: 162
wordpress_url: http://www.bitter-gamer.com/?p=162
date: '2008-11-24 08:52:10 -0500'
date_gmt: '2008-11-24 13:52:10 -0500'
categories:
- programming
tags:
- programming
- Flash
- actionscript
- vector graphics
comments:
- id: 95
  author: Tyler
  author_email: tylerbren@gmail.com
  author_url: ''
  date: '2008-11-24 11:40:25 -0500'
  date_gmt: '2008-11-24 16:40:25 -0500'
  content: Only took a few months but it looks like we got some stuff going finally
    hah
---
<p>So, although Flash/Actionscript has super easy ways to scale and rotate a graphical object, when I loaded up a PNG for my spaceship and tried rotating it, it looked pretty ugly. Of course, I didn't expect OpenGL-quality scaling and rotation, but I was surprised at how bad it looked. I soon learned that while you can easily import bitmap graphics into Flash (i.e. GIF, JPG, PNG) they don't keep their quality if you scale or rotate them. In order to do that, you need to use vector graphics. The gist of vector vs. bitmap graphics is that bitmaps are based on pixels, which do not scale very well, while vector graphics are based on mathematical equations that can be scaled based on screen/size requirements.</p>
<p>One benefit of the Flash IDE is that you can easily create vector graphics and use them in your movie/program. In my initial research, it wasn't immediately apparent if you could create vector graphics in another program and then import to Flash. Of course, you can do it with Adobe Illustrator, but how about some other (free) program? </p>
<p>Turns out that you can. <a href="http://www.inkscape.org/" title="Inkscape">Inkscape</a> is a free vector graphics editor, which can output SVG file format images that can be directly imported via Actionscript into your Flash program. Pretty great! One of my goals for today is to learn the basics of a vector graphics editor... I'm fairly familiar with programs like Photoship/GIMP, but Inkscape seems to have some different paradigms that I'll have to pick up.</p>
