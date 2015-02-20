---
layout: post
status: publish
published: true
title: How many times can you call a recursive function in JavaScript?
author:
  display_name: Nathan
  login: admin
  email: ndemick@gmail.com
  url: ''
author_login: admin
author_email: ndemick@gmail.com
wordpress_id: 1686
wordpress_url: http://nathandemick.com/?p=1686
date: '2013-04-11 14:20:35 -0400'
date_gmt: '2013-04-11 19:20:35 -0400'
categories:
- programming
tags:
- javascript
comments: []
---
<p>Hmm, that's a question you probably have NEVER thought about, amirite? Well, after doing a bit of random JavaScript programming yesterday to help out a co-worker, he expressed concern that the solution I implemented (which used recursion) might have problems if the number of iterations was very large. To be honest, I'd never thought about it before; my ignorance stemmed from the fact that I've never had to deal with a data set large enough to cause a stack overflow from using recursion. </p>
<p>So, is this a valid concern? Should you stop writing recursive functions? After a quick search on Stack Overflow (oh, the irony), I found <a href="http://stackoverflow.com/questions/2805172/what-are-the-js-recursion-limits-for-firefox-chrome-safari-ie-etc/2805230" title="this answer">this answer</a>, which, while old, gives you a general idea of what to expect with modern browsers.</p>
<p>I threw together a quick <a href="http://jsfiddle.net/TdWTs/" title="jsfiddle">jsFiddle</a> that you can run in your favorite browser to find out the limits today. The answer's author also <a href="http://adamrich.name/recursion.html">put together a test</a> which displays results for multiple browsers, so you can see some more up-to-date numbers.</p>
<p>The end result? Unless you're operating on a data set numbering in the tens of thousands, you don't have to worry about your recursive algorithm crashing. And the sad part is that my co-worker still wanted me to re-write my code.</p>
