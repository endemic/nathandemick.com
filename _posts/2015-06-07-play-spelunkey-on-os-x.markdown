---
layout: post
status: publish
published: true
title: Play Spelunky on OS X!
author:
  display_name: Nathan
  email: ndemick@gmail.com
date: 2015-06-07 20:15:42 -0400
categories:
- games
tags:
- spelunky
- wine
- gaming
- os x
comments: []
---
[Spelunky](http://www.spelunkyworld.com/) is a great game. I remember
playing the first freeware version, and sucking at it. I don't think
I ever got past the Mines. Never owned an Xbox 360, so I wasn't able to play the
HD remake when it was first released. I shed bitter tears about that. Imagine
my joy when a port was released for PS3 (which I actually owned)! Imagine my
anguish when my PS3 bit the dust, suffering from the dreaded "[Yellow Light of
Death!](https://en.wikipedia.org/wiki/PlayStation_3#Questions_regarding_reliability)"

While there is a PC version of the game, no OS X port has been released, and
it's looking rather unlikely at this point. Fortunately, it's super easy to
get the Windows version of the game running in Wine! Even better, there's an
application called Wineskin Winery, which will bundle the Windows .exe into its
own self-contained Mac .app bundle! When you get the whole thing working, it's
totally seamless and amazing. While I found a few tutorials online to help walk
through the process of getting Spelunky up and running, they were a bit sketchy,
so I figured I'd recount the process here, complete with screenshots. Note that
I'm running the [GOG](http://www.gog.com/game/spelunky) version.

1. Download [Wineskin Winery](http://wineskin.urgesoftware.com/tiki-index.php).
   When you start the app, you'll see [something like this](/assets/uploads/2015/06/spelunky/0.png)
2. [Install an engine](/assets/uploads/2015/06/spelunky/0.png). I installed
   1.7.29, but you can probably use anything newer.
3. Click "Create New Blank Wrapper." [Give it an awesome name](/assets/uploads/2015/06/spelunky/2.png).
4. [The wrapper is done!](/assets/uploads/2015/06/spelunky/3.png) Click the "view
   wrapper in Finder" button.
5. Right-click the wrapper app and [choose "Show package contents."](/assets/uploads/2015/06/spelunky/4.png)
6. You'll see an app called `Wineskin.app`. [Open it](/assets/uploads/2015/06/spelunky/5.png),
   then choose "Install Software."
7. The installer will allow you to [choose a setup executable](/assets/uploads/2015/06/spelunky/6.png). Click
   that then [choose the Spelunky setup .exe](/assets/uploads/2015/06/spelunky/7.png).
8. [Install it!](/assets/uploads/2015/06/spelunky/8.png)
9. Click the "Advanced" options and choose ["Tools" -> "Winetricks"](/assets/uploads/2015/06/spelunky/9.png).
10. [Install `d3dx9` from the "dlls" section.](/assets/uploads/2015/06/spelunky/10.png)
11. Do a test run. Hopefully it should work!
12. Use [Controllers](https://vividmachine.com/controllers/) to map keyboard input
    to your Bluetooth game controller!

Now, enjoy some of that sweet, sweet Spelunky-ing.


