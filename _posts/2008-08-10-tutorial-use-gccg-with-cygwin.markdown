---
layout: post
status: publish
published: true
title: 'Tutorial: Use gcc/g++ with Cygwin'
author:
  display_name: Nathan
  login: admin
  email: ndemick@gmail.com
  url: ''
author_login: admin
author_email: ndemick@gmail.com
wordpress_id: 129
wordpress_url: http://www.bitter-gamer.com/?p=129
date: '2008-08-10 18:18:43 -0400'
date_gmt: '2008-08-10 23:18:43 -0400'
categories:
- random
tags:
- programming
- tutorial
comments: []
---
<p>One of the problems that I always faced as a developer was what compiler to use on the Windows platform. While Linux-based operating systems come with their own compilers, Windows users are kinda screwed... I think the last tool that came with DOS/Windows and allowed you to make programs was QBasic. So the question is, what're some free tools I can use to make Windows binaries?</p>
<p>Enter <a href="http://www.cygwin.com" title="Cygwin">Cygwin</a>, a Linux-like interface for Windows. It has the bash shell, as well as lots of popular tools, such as C/C++ compilers. This is pretty much just what we want, eh? </p>
<p>Let's download and set up Cygwin. Hit up the website and click the "get Cygwin" link on the right. Run the installer, and make sure to have the 'developer tools' option checked during setup. When you're done with that, <a href="http://www.libsdl.org/extras/win32/cygwin/README.txt" title="this readme">this readme</a> has all the information you need regarding installing the SDL library. OpenGL libraries will be installed with Cygwin by default.</p>
<p>That's it! You're ready to rock. Just compile your SDL/OpenGL program using a command similar to this:</p>
<p><code>gcc -o test.exe main.c `sdl-config --cflags --libs` -lglu32 -lopengl32</code></p>
<p>If you're using SDL, make sure to have a copy of SDL.dll in the directory your program is in. </p>
