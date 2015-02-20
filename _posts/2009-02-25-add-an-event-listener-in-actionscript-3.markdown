---
layout: post
status: publish
published: true
title: Add an Event Listener in Actionscript 3
author:
  display_name: Nathan
  login: admin
  email: ndemick@gmail.com
  url: ''
author_login: admin
author_email: ndemick@gmail.com
wordpress_id: 218
wordpress_url: http://www.bitter-gamer.com/?p=218
date: '2009-02-25 14:32:48 -0500'
date_gmt: '2009-02-25 19:32:48 -0500'
categories:
- programming
tags:
- programming
- tutorial
- Flash
- actionscript
comments: []
---
<p>Importing graphics into your Flash program is all well and good. You can create movies or animation, but the real interesting thing is taking user input and having your program react to it. The way to do that in Actionscript is to add "Event Listeners" to objects you create. Whenever an event occurs (such as a keypress, mouse movement, or whatever), your Event Listener checks to see if it's supposed to do anything. If so, then it runs a function with code that you specify. So for example, say the user presses the "left arrow" key. Your keyboard input event handler sees this, and runs appropriate code (in this case, it might move a game character left). </p>
<p>One of the most basic events in Actionscript is the "enter frame" event. This triggers every time the SWF is redrawn, and basically corresponds to the SWF frame rate. In the following example, we're going to create a new class, and add an "enter frame" event listener to it, so that whenever a new instance of that class is created, a function will run at frame rate. </p>
<pre class="brush:js">
package {
  import flash.display.Sprite;
  import flash.events.Event;  // Required to add event listeners
  
  // Set our SWF framerate, width, height, and background color
  [SWF(frameRate='30', width='640', height='480', backgroundColor='0xffffff')]

  public class EventListenerExample extends Sprite {

    [Embed(source="ball.svg")]
    public var BallGraphic:Class;
	
      // Variables used to store movement data
      private var dx:int = 5;
      private var dy:int = 5;
	
    public function EventListenerExample():void
    {
      // Create instance of imported graphic
      var b:Sprite = new BallGraphic();

      // Add to this display object
      this.addChild(b);

      // Attach event listener
      // Listen for "ENTER_FRAME" event
      // Run the "enterFrame" function 
      this.addEventListener(Event.ENTER_FRAME, enterFrame);
    }

	public function enterFrame(e:Event):void 
	{
	  // Increment position
	  this.x += this.dx;
	  this.y += this.dy;
		
	  // If object passes beyond SWF boundaries,
	  // reverse direction
	  if(this.x &gt;= 640 - this.width || this.x &lt;= 0)
	    this.dx *= -1;
	  if(this.y &gt;= 480 - this.height || this.y &lt;= 0)
	    this.dy *= -1;
	}
  }
}
</pre>
<p>Save this code in a file named 'EventListenerExample.as'. You can see that we've elaborated a bit on our last example, importing and displaying an SVG graphic. However, this time we add some variables to the class that represent speed (delta-x and delta-y). We attach the event listener by calling <code>this.addEventListener (Event.ENTER_FRAME, enterFrame);</code>. The first argument is the type of event the listener is triggered by, and the second is the name of the function to run when the event is detected. </p>
<p>In the declaration of the 'enterFrame' function, we pass it details of the event that triggered it by putting <code>e:Event</code> in the arguments list. The function doesn't actually use that information, but simply moves our graphic around, bouncing off the "walls" of the SWF. Movement is just one possible application of the 'enter frame' event; collision detection can also be calculated this way, among other things.</p>
