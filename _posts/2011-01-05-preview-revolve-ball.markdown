---
layout: post
status: publish
published: true
title: 'Preview: Revolve Ball'
author:
  display_name: nathan
  login: nathan
  email: ndemick@gmail.com
  url: ''
author_login: nathan
author_email: ndemick@gmail.com
wordpress_id: 176
wordpress_url: http://ganbarugames.com/?p=176
date: '2011-01-05 08:00:02 -0500'
date_gmt: '2011-01-05 13:00:02 -0500'
categories:
- Games
tags:
- iOS
- games
- ganbaru games
- revolve ball
- preview
- in development
comments:
- id: 18
  author: 'App Pricing Experiment: Results | Ganbaru Games'
  author_email: ''
  author_url: http://ganbarugames.com/2011/02/app-pricing-experiment-results/
  date: '2011-02-16 09:18:16 -0500'
  date_gmt: '2011-02-16 14:18:16 -0500'
  content: '[...] experiment has made me also reconsider the pricing of Revolve Ball.
    Originally I was thinking about going with $1.99, due to the length of the game.
    However, [...]'
---
<p><a href="http://ganbarugames.com/wp-content/uploads/2011/01/Default.png"><img src="http://ganbarugames.com/wp-content/uploads/2011/01/Default-100x150.png" alt="" title="Revolve Ball Splash Screen" width="100" height="150" class="alignleft size-thumbnail wp-image-207" /></a>So I figured that I'd do a quick preview of the next game I'm working on. It's called <strong>Revolve Ball</strong>, and it's a remake of a game that my friend Sam and I created in college, which is in turn a clone of an old Taito game called Camel Try. I was first introduced to Camel Try by another friend, Adam, who was a MAME enthusiast. Even though Camel Try's controls were a little bit janky, I really enjoyed the concept of the game. A while later, my friend Sam and I took a computer graphics course that emphasized OpenGL. We paired up for our final project, and decided that a game like Camel Try would be an excellent way to showcase the <code>glRotate()</code> function. Well, to be honest, such a game was beyond our capabilities at the time. We ended up creating something that <em>mostly</em> worked, but was pretty ugly. The collision detection was not robust at all, and the graphics were bare-bones. I think we maybe got a C, which (in retrospect) was generous. </p>
<p><a href="http://ganbarugames.com/wp-content/uploads/2011/01/revolve-ball-preview-1.png"><img src="http://ganbarugames.com/wp-content/uploads/2011/01/revolve-ball-preview-1-100x150.png" alt="" title="revolve-ball-preview-1" width="100" height="150" class="alignright size-thumbnail wp-image-202" /></a>Fast forward a few years to my renewed interest in game development. I learned some Actionscript and had released a Flash game or two, when I decided that I wanted to recreate my old game. I guess it was because I felt unsatisfied with the original result. I actually got a decent groundwork started for a Flash version; my program interpreted .png files to use as level layouts, and used a grid to hide/display the sprites that made up a level based on their proximity to the player. I even implemented the <a href="http://www.metanetsoftware.com/technique/tutorialA.html">Separating Axis Theorem</a> to use for collision detection. However, I never completed the game. I don't know if I just got bored, or discouraged from doing too much low-level programming (i.e. not making content), or what.</p>
<p><a href="http://ganbarugames.com/wp-content/uploads/2011/01/revolve-ball-preview-2.png"><img src="http://ganbarugames.com/wp-content/uploads/2011/01/revolve-ball-preview-2-100x150.png" alt="" title="revolve-ball-preview-2" width="100" height="150" class="alignleft size-thumbnail wp-image-203" /></a>Once I finished <a href="/nonogram-madness/" title="Nonogram Madness">Nonogram Madness</a>, though, I decided I wanted to revisit this game concept yet again, this time on iOS. This time, however, I was able to stand on the shoulders of a few giants (in the form of cocos2d and Box2D). With the interface and physics frameworks already written, I was able to more quickly get my engine into a state where I could start creating content for an actual game. </p>
<p>The concept behind Revolve Ball is similar to many "maze"-type games, where the player must navigate a marble through an obstacle course. The difference is that in Revolve Ball, the ball is viewed from the side, and constantly falls "downward" due to gravity. The player then spins the maze around the ball in an effort to find the exit. While this type of game was fun to play with a mouse or keyboard, I think a touchscreen is the ideal controller. There's a real feeling of interaction as you spin each level around with your finger which is quite appealing. </p>
<p><a href="http://ganbarugames.com/wp-content/uploads/2011/01/revolve-ball-preview-3.png"><img src="http://ganbarugames.com/wp-content/uploads/2011/01/revolve-ball-preview-3-100x150.png" alt="" title="revolve-ball-preview-3" width="100" height="150" class="alignright size-thumbnail wp-image-204" /></a>Right now I'm in the middle of creating levels for the game. I'd like to publish with 40 levels, and increase the number as I push updates. One of the biggest things I've learned so far is that making game content is extremely time consuming. My next game is going to have automatically-generated content =] I'm not sure how long it's going to take me to finish, but it's going to be before April 10th... that's the day that Apple will remove my app entry in iTunes for not having the program actually uploaded =] Let me know in the comments or on Twitter if you're interested in testing out the app, since I'll be sending it out to a few people before the official launch. </p>
