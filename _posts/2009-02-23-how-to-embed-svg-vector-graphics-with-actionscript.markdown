---
layout: post
status: publish
published: true
title: How to embed SVG vector graphics with Actionscript
author:
  display_name: Nathan
  login: admin
  email: ndemick@gmail.com
  url: ''
author_login: admin
author_email: ndemick@gmail.com
wordpress_id: 207
wordpress_url: /?p=207
date: '2009-02-23 13:39:49 -0500'
date_gmt: '2009-02-23 18:39:49 -0500'
categories:
- programming
tags:
- programming
- tutorial
- Flash
comments:
- id: 284
  author: ReaperOscuro
  author_email: ronchiS@hotmail.co.uk
  author_url: ''
  date: '2011-06-15 15:53:59 -0400'
  date_gmt: '2011-06-15 20:53:59 -0400'
  content: "Evening,\r\n\r\nThank you very very much for the help: not sure why needed
    to save as plain SVG, but twas done. Followed the syntax yet was still failing,
    then noticed that when I embedded it created:\r\n[Embed(source='../lib/background.svg',
    mimeType='application/octet-stream')]\r\nwhen I removed the mimeType it then worked.\r\n\r\nThanks
    for your time!"
- id: 286
  author: ReaperOscuro
  author_email: ronchiS@hotmail.co.uk
  author_url: ''
  date: '2011-07-05 15:49:13 -0400'
  date_gmt: '2011-07-05 20:49:13 -0400'
  content: "Evening,\r\n\r\nMy problem is tranferring inkscapes alpha channel: at
    least, thats what I think.\r\nIve followed all that is said here and my svg loads
    fine -but it looks crap. Upon closer inspection I realised: the semi-transparent
    extra colour layers id added were not opaque anymore, making it too vivid.\r\nSo,
    how do I make ac3 recognise that it also needs to include such? I appreciate this
    post is some years.old but you never know, someone hopefully will notice.\r\n\r\nThanks
    in advance for your time,\r\n\r\nReaperOscuro"
---
One of the big downsides about not using the Flash IDE for development is that
it's much more of a hassle to bring graphics into your program. The IDE has a
built in vector illustration program, which allows the user to create graphical
objects (or import them from Illustrator) and link them right up to a
corresponding Actionscript object. If you're making programs with the Flex SDK,
however, getting graphics is a bit more of a chore. Fortunately, it's not nearly
as difficult as programming graphics via Actionscript.

<a href="/uploads/2009/02/inkscape-1.png">
  <img src="/uploads/2009/02/inkscape-1-123x150.png" alt="Inkscape &#39;New&#39; File Menu" width="123" height="150" class="alignleft size-thumbnail wp-image-211" /></a>

First, you'll want to get a vector illustration program. Adobe makes
Illustrator, which might be your first thought, but we're trying to do things
on the cheap here, otherwise we'd just get the Flash IDE.
[Inkscape](http://www.inkscape.org/download/?lang=en) is a free program which
can save files in the [SVG (scalable vector graphics)](http://en.wikipedia.org/wiki/Scalable_Vector_Graphics)
format. Grab a copy of Inkscape, and fire it up (OS X users prior to 10.5 will
need to [install X11](http://www.apple.com/downloads/macosx/apple/macosx_updates/x11formacosx.html)).

<a href="/uploads/2009/02/inkscape-2.png"><img src="/uploads/2009/02/inkscape-2-132x150.png" alt="Create a circle in Inkscape" width="132" height="150" class="alignright size-thumbnail wp-image-212" /></a>

Inkscape starts up by creating a default document, which is much larger than
anything we would normally use. From the 'File' menu, navigate to the 'New 32x32
Icon' option. Now, in the smaller image, use the 'Circle' tool to create a
circle. Take some time here to play around with Inkscape: experiment with
changing the color of the circle, give it a border, do whatever you like. When
you're satisfied with what you have, click 'Save' and save the image as a 'Plain
SVG.' Now, create a new Actionscript file in the same directory as the graphic
file called 'SVGExample.as', and enter the following code:

<pre class="brush:js">
package {
  import flash.display.Sprite;

  public class SVGExample extends Sprite {

    [Embed(source="ball.svg")]
    public var BallGraphic:Class;

    public function SVGExample():void
    {
       var b:Sprite = new BallGraphic();
       b.x = 100;
       b.y = 100;
       addChild(b);
    }
  }
}
</pre>

The way that graphics are embedded is as follows: first, you use the 'Embed'
syntax to specify where the image is, and then you link that embedded asset to a
unique class name. Here, I call it "BallGraphic," but you can use anything that
makes sense to you. Creating an instance of that class (when I call <code>new
BallGraphic()</code>) loads the graphic, and it can then be added to a display
object container and shown on the screen. When you compile this code and run the
SWF, you should see your graphic on the stage. You can now easily import SVG
graphics (or even other image types, such as .gif/.jpg) via Actionscript.
