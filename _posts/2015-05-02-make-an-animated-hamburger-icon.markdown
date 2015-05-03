---
layout: post
status: publish
published: true
title: Make an animated hamburger icon!
author:
  display_name: Nathan
  email: ndemick@gmail.com
date: 2015-05-02 23:49:23 -0400
categories:
- programming
tags:
- html
- css
- javascript
comments: []
---
I've been using the Lollipop version of Gmail quite a bit recently. One neat
little detail is that whenever you drill down into the individual email view,
the "hamburger" button in the upper left smoothly animates into a "back" button.
In fact, you've probably seen this effect quite a lot -- a simple search for
"[animated hamburger icon](https://encrypted.google.com/search?hl=en&q=animated%20hamburger%20icon)"
returns a boatload of results. Most of the techniques for doing this sort of
effect on the web utilize some sort of CSS trickery: they'll use psuedo-
elements to create the hamburger, then animate it all with transforms.

What if you have to support older browsers in your site? I know it's hard to
resist the shiny new features in the most recent version of Chrome, but
lots of folks still use (gasp!) IE8 (or older). In fact, one of the sites that
I help administer has an even split of users between Chrome and IE8. For that
reason, I was thinking about how I could implement a hamburger animation in
a way that wouldn't totally break for IE8 users.

![animated hamburger icon](/assets/uploads/2015/04/hamburger-to-arrow.gif)

I ended up simply using two images, a "hamburger" and an arrow, then fading
between them. On newer browsers that support transforms, the fade is obscured
by a rotation animation. Sure, it's hacky; the cooler versions of this effect
will create the hamburger using DOM elements, then animate each one into
position. But most end users won't notice the difference. And using images
will allow older browsers to get an approximation of the effect.

Check out a [JSFiddle with the implementation details](http://jsfiddle.net/zr3zmgbv/1/).
