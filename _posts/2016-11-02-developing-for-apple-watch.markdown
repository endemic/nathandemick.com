---
layout: post
status: publish
published: true
title: Developing for Apple Watch
author:
  display_name: Nathan
  email: ndemick@gmail.com
date: 2016-11-02 15:20:32 -0400
categories:
- programming
tags:
- programming
- apple
comments: []
---
Recently I was tasked with developing an Apple Watch extension for an existing
iOS app. Since I have no interest in Apple Watch, I'd never taken the time to
use one, or investigate the development process. After about a month of banging
my head against the keyboard (in a metaphorical sense), I thought I would
complain about my experience on the intarnets.

First of all, Xcode won't install development builds if the watch is locked, and the watch
locks itself on sleep when not being worn. So you basically have to be wear it
in order to do any sort of active development. Annoying if wearing something on
your wrist is irritating whilst typing.

Speaking of wearing the watch: the plastic band which is included with the cheapest watch is the absolute
worst. To secure the clasp, you need to thread the loose end of the strap in
such a way that the rubbery exterior rubs right against your wrist, catching
and pulling out every arm hair in its path.

When testing a watch app on the actual device, the app never launches automatically.
Xcode says it is running, but there's no indication on the watch itself. My
technique here is to open an unreleated app, which seems to trigger something
and remind the watch that it's supposed to be running the development target.

The watch simulator is no better. Apple Watch has two modes of interaction: touch and "Force Touch." The simulator's
default option is to differentiate between the two by using Apple's new pressure-sensitive
trackpads (if available). Problem is, it doesn't work. Then you need to switch
input modes by using a keyboard shortcut. Except the shortcut doesn't always
work either. When trying to bring up a context menu, I'll Cmd+Shift+2 to trigger
a "deep press," then tap the simulator, and nothing happens. It seems to randomly
work on the 3rd or 4th try.

Communication between the watch and phone is slow and/or buggy. Even on the
simulator! I guess maybe they're trying to totally emulate real-world behavior,
which in that case kudos all around. I will randomly get `WCErrorCodeMessageReplyTimedOut`
errors, then do the exact same thing a second later and have it work flawlessly.

Speaking of communication, you'll probably want/need to communicate with the
parent iOS app from a number of the different views in your watch app. Problem
here is that only one WatchKit class can receive messages from the phone. So
you end up making your extension delegate the message-sending delegate as well,
and handle communication within the watch app by sending notifications everywhere.
For a simple app it might not be so bad, but that sort of architecture gets
unwieldy rather quickly. Maybe I'm just a dummy, but Apple's documentation sure
doesn't mention any other potential design patterns.

Speaking of documentation, Apple's documentation is... not great. Many times there was no differentiation
between watchOS 2 and watchOS 3 APIs. I spent a ton of time finding out that
it is impossible to share UserDefaults between watch and phone. Problem is, it _used_
to be possible, and so I fiddled about implementing "solutions" that never worked.
I ran into two issues that the documentation makes no mention about. I don't often ask questions on Stack Overflow, but did
for these [particular](http://stackoverflow.com/questions/39834845/watchos-app-resets-to-root-view-controller-after-display-sleep)
[problems](http://stackoverflow.com/questions/40293457/watchos-3-app-restarts-after-tapping-complication).
The answers I got were underwhelming, to say the least.

Basically, the entire process was death-by-one-thousand-cuts frustrating. I wasn't
bullish on the entire concept of smartwatches, and if this is what the "best"
has to offer, I might be put off it for good.
