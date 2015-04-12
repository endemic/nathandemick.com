---
layout: post
status: publish
published: true
title: 'Tutorial: Setting up a free OpenGL/SDL development environment on&nbsp;Windows'
author:
  display_name: Nathan
  email: ndemick@gmail.com
date: 2007-01-10 15:47:09.000000000 -05:00
comments: []
---
Life has been boring me recently. Yeah, yeah, typical angst, right? Well, in any case, I'd been thinking about getting back into games programming. I've been seeing some sweet indie games, especially shmups, and wondered if perhaps I haven't put enough effort into this realm of programming. 'Course, there's no way I'll be any good from a technical standpoint, but it's something I could be OK at. Right, enough blathering.<br /><br />
I made my first game (which was 3.5 years ago... holy crap!) on OS X, with its nice, free IDE. That was back before Xcode, when it was called Project Builder. Anyway, it was easy to make programs for it... just downloaded a project template and coded away. On my PC, I had a borrowed copy of Visual C++, which was also easy enough to use. However, it's been years since then, and I don't have a Mac, or access to Visual C++. What're some free tools I can use to make Windows binaries?<br /><br />
Enter <a href="http://www.cygwin.com">Cygwin</a>, a Unix-like interface for Windows. It replicates the Unix shell, as well as lots of popular tools, such as the GCC compiler. Now we're getting somewhere, eh? I like to use SDL as a base for OpenGL, due to its easy-to-use input handling and other game-friendly functions. GLUT is just not up to the task. I prefer OpenGL over SDL's sprite blitting functions due to such features as easy scaling and rotation. Anyway, let's download and set up Cygwin. Make sure to have the 'developer tools' option checked during setup. When you're done with that, <a href="http://www.libsdl.org/extras/win32/cygwin/README.txt">This README</a> has all the information you need regarding installing the SDL library. OpenGL libraries will be installed with Cygwin by default. <br /><br />
That's it! You're ready to rock. Just compile your program using a command similar to this:
<div class="code">
gcc -o test.exe main.c `sdl-config --cflags --libs` -lglu32 -lopengl32
</div>
Make sure to have a copy of SDL.dll in the directory your program is in. Zomg, it's been a while since I've done all this... it seems crazy to get back into.