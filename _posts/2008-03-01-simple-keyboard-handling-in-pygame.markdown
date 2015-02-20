---
layout: post
status: publish
published: true
title: Simple keyboard handling in PyGame
author:
  display_name: Nathan
  login: admin
  email: ndemick@gmail.com
  url: ''
author_login: admin
author_email: ndemick@gmail.com
wordpress_id: 91
wordpress_url: http://www.bitter-gamer.com/2008/03/01/simple-keyboard-handling-in-pygame/
date: '2008-03-01 11:59:41 -0500'
date_gmt: '2008-03-01 15:59:41 -0500'
categories:
- games
tags: []
comments: []
---
<p>Seriously, how easy is this? For smooth movement, usually a boolean "move" variable is set on a keydown event, and unset on a keyup. Then while the boolean is true, a game object is moved.</p>
<pre>
#!/usr/bin/python
import pygame, sys
from pygame.locals import *

# Init screen
pygame.init()
screen=pygame.display.set_mode((200,50))
pygame.display.set_caption('Keyboard input test')
pygame.mouse.set_visible(0)

# Main loop
while 1:
	# Process events in event queue
	for event in pygame.event.get():
		if event.type==QUIT: sys.exit()	# Exits the 'main' function
		elif event.type==KEYDOWN and event.key==K_ESCAPE: sys.exit()

		elif event.type==KEYDOWN and event.key==K_UP: print "up!"
		elif event.type==KEYUP and event.key==K_UP: print "up off!"

		elif event.type==KEYDOWN and event.key==K_DOWN: print "down!"
		elif event.type==KEYUP and event.key==K_DOWN: print "down off!"

		elif event.type==KEYDOWN and event.key==K_LEFT: print "left!"
		elif event.type==KEYUP and event.key==K_LEFT: print "left off!"

		elif event.type==KEYDOWN and event.key==K_RIGHT: print "right!"
		elif event.type==KEYUP and event.key==K_RIGHT: print "right up!"
</pre>
