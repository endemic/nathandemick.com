---
layout: post
status: publish
published: true
title: Experimenting with Javascript
author:
  display_name: nathan
  login: nathan
  email: ndemick@gmail.com
  url: ''
author_login: nathan
author_email: ndemick@gmail.com
wordpress_id: 538
wordpress_url: http://ganbarugames.com/?p=538
date: '2012-06-26 11:57:47 -0400'
date_gmt: '2012-06-26 15:57:47 -0400'
categories:
- Programming
tags:
- shikaku madness
- javascript
- coffeescript
comments: []
---
<p>In <a href="http://ganbarugames.com/2012/05/resolution-woes/" title="Resolution Woes">my last post</a> I complained about dealing with all the static images that one has to create in order to support multiple iOS device resolutions. I was just getting so frustrated dealing with layouts that required 3 different static images, and having to jump through hoops whenever I wanted to display some sort of variable length text. About that time, I was tasked with creating a Javascript-based game at work (the very first of my life, which was kind of a milestone), with the requirements that it be DOM-based (not sure why that requirement existed, since the graphics were all bitmap, but I digress). Anyway, my thoughts turned to using HTML and CSS for the interface of Shikaku Madness, the game I was working on. It was a perfect fit, actually, since the UI could be easily recreated with HTML elements. While I promised myself that I would finish the Objective-C version of the game first, before experimenting with unproven technology, the lure of doing something new proved to be too much. Within a week I had ported most of my main game logic over to Javascript (CoffeeScript, actually).</p>
<p>Another plus for creating a game with Javascript is its' portability and multiple deployment targets. I could put a version on the web for prospective players to try for free, and also port it to a variety of different platforms using a tool like Apache Cordova. And there could be additional porting opportunities in the future: Microsoft is getting on the Javascript bandwagon these days, making Javascript a first-class citizen for both Windows 8 and Windows Phone 8, and Mozilla is working on the B2G (Boot-to-Gecko) project which will allow web apps native access to a mobile device. While it's not a "write once, run anywhere" situation, Javascript has the potential to run on many more platforms than Objective-C does.</p>
<p>In the process of porting my game, I learned quite a few interesting things about developing "HTML5" games (kind of a misnomer), which I thought I would share here. First off, Javascript performance in Mobile Safari is quite crap. Even running with the "Nitro" Javascript engine, it's considerably slower than your desktop. Shikaku Madness is about as simple as you can get for user interaction &mdash; only one touch is being tracked at a time, and a single HTML element's size/position is being updated based on that input. Even still, the UI lags behind user input... it's not unplayable, but it's noticeably slower than native code. </p>
<p>There are a few tricks you can do to make some interactions feel more responsive. Using the CSS3 transform property, you can animate HTML elements with hardware acceleration, which makes movement much smoother. Instead of relying on a "click" event to trigger button actions, you can listen for a "touchstart" event, which fires instantly when the user taps an element. Even with these improvements, though, the app isn't quite as responsive as you would expect. I feel like the performance is almost there, though.</p>
<p>Mobile Safari's audio support is also quite crap. Even if a sound is preloaded, there's a noticeable delay when the sound is first played. Another annoying problem is that sound effects played through Mobile Safari ignore the hardware mute button, and the volume can't easily be changed by using the hardware buttons (you have to hit the +/- buttons at the exact same time the sound is being played, otherwise iOS thinks you're trying to adjust the ringer volume).</p>
<p>Although I chose a DOM-based UI instead of using the canvas element (so that I could use CSS to style my interface), I learned that it's not quite as easy as I thought to have a totally dynamic application size. In fact, the version of Shikaku Madness that I submitted to the App Store uses fixed element width/height and font sizes. I'm still working on making my CSS dynamic enough to handle arbitrary viewport sizes, which will be a necessity if I try to publish an Android version. The key problem is that it's not possible to dynamically scale font size using CSS alone. The other problem is that I need to maintain a 2:3 aspect ratio in order to keep the layout consistent. I think I'm going to solve this by querying the viewport size, then modifying the app's container element and font sizes at runtime. </p>
<p>I've just scratched the surface in regards to getting Shikaku Madness on multiple platforms. My next step is going to be publishing on the Mac App Store, then trying for a Google Play release. After that I might try submitting to the Mozilla Marketplace and whatever the Windows app store is called... as long as I can get enough motivation to keep working.</p>
<p>Regardless, you should definitely check out the <a href="http://shikaku.ganbarugames.com" title="Shikaku Madness">Shikaku Madness demo page</a> I set up. The app should run with recent versions of Firefox, Safari, and Chrome. It might or might not work with IE9/10. Sadly, I don't have a recent enough copy of Windows to try out the modern versions of IE. Let me know in the comments if it borks on IE. Other comments and suggestions are welcome too!</p>
