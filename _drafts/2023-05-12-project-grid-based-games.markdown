---
layout: post
title: "Project: Grid-based Games"
author:
  display_name: Nathan
  email: ndemick@gmail.com
date: 2023-05-12 11:42:13 -0400
categories:
- game development
comments: []
---
It's been a little while since I've done any side projects. My last real burst of inspiration was after making a bunch of improvements to [Arcadia](), my `<canvas>`-based game framework. I wrote [Let's Build Bridges](), and then re-wrote some of my other puzzle games to use it. I was working on an [Akari]() implementation, but kinda got bored with making the levels. Instead of actually buckling down and creating content, I started experimenting with re-writing the game engine using the DOM, rather than a canvas tag. `<canvas>` (or a WebGL context, or whatever) is great, but you have to deal with re-implementing a lot of functionality that _could_ be obtained from the browser for free.

As an example, say that you want to translate a player's mouse click/finger tap into game coordinates, and determine the spot on a puzzle grid that they want to interact with.
