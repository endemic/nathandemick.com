---
layout: post
status: publish
published: true
title: RequireCS project boilerplate on GitHub
author:
  display_name: nathan
  login: nathan
  email: ndemick@gmail.com
  url: ''
author_login: nathan
author_email: ndemick@gmail.com
wordpress_id: 557
wordpress_url: http://ganbarugames.com/?p=557
date: '2012-08-16 06:09:10 -0400'
date_gmt: '2012-08-16 10:09:10 -0400'
categories:
- Programming
tags:
- javascript
- coffeescript
- github
comments: []
---
So I finally got around to creating a repository on GitHub. I thought it might 
be useful for others to see the project structure I used to build Shikaku 
Madness, so I ripped out most of the guts and uploaded it. It uses Backbone for 
structure, and loads dependencies using RequireJS. I also used James Burke's 
CoffeeScript plugin for RequireJS, which means you can write CoffeeScript and 
it'll be interpreted on page load, without having a separate compilation step.

It's pretty bare bones at the moment, with just two "views" and buttons to 
transition between them. I haven't decided how much additional code I'll put in, 
but it's definitely a work in progress. If you have any interest in what a 
simple "modern" Javascript project might look like, you should definitely
[check it out on GitHub](https://github.com/endemic/requirecs).
