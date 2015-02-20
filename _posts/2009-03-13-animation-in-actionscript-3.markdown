---
layout: post
status: publish
published: true
title: Animation in Actionscript 3
author:
  display_name: Nathan
  login: admin
  email: ndemick@gmail.com
  url: ''
author_login: admin
author_email: ndemick@gmail.com
wordpress_id: 241
wordpress_url: http://www.bitter-gamer.com/?p=241
date: '2009-03-13 12:21:58 -0400'
date_gmt: '2009-03-13 17:21:58 -0400'
categories:
- programming
tags:
- Flash
- actionscript
- animation
comments: []
---
<p>I think one of the main disadvantages of using the Flex compiler to create Flash programs is that animation is a bit more difficult to create (although, to tell the truth, I've never used the Flash IDE enough to be able to compare them). I think for most simple games, you can get away with not animating any of your characters. But once you get into creating games that have more detailed characters, you pretty much need to add some sort of animation. We can do that pretty easily by loading multiple images into a DisplayObjectContainer (such as a Sprite) and then showing/hiding each image in turn. Take a look at the following example:</p>
<pre class="brush:js">
package {
  import flash.display.Sprite;
  import flash.events.Event;
  import flash.utils.getTimer;	// for getTimer()
	
  // Set SWF FPS, etc.
  [SWF(frameRate='30', width='200', height='200', backgroundColor='0xffffff')]
	
  public class AnimationExample extends Sprite {

    // For frame rate info
    public var ticks:Number = 0;
    public var framesPerSecond:Number;
    public var frameTimer:Number = 0;
    public var currentAnimationFrame:int = 0;
		
    // For animation
    [Embed(source="run-1.svg")]
    public var animationFrame1:Class;
    [Embed(source="run-2.svg")]
    public var animationFrame2:Class;
    [Embed(source="run-3.svg")]
    public var animationFrame3:Class;
		
    public var character:Sprite;
		
    public function AnimationExample():void {

      // Create new sprite for animation frames
      character = new Sprite();
			
      // Add frames, hide all but the first one
      character.addChild(new animationFrame1());
      character.addChild(new animationFrame2());
      character.addChild(new animationFrame3());
      character.getChildAt(1).visible = false;
      character.getChildAt(2).visible = false;

      this.addChild(character);
			
      // This will call the animation function
      this.addEventListener(Event.ENTER_FRAME, enterFrame);
    }
		
    public function enterFrame(e:Event = null):void {
      // getTimer() provides # of ms since Flash Player started
      var currentTicks:Number = getTimer();
			
      // Figure out how many seconds each frame is displaying for
      var secondsPerFrame:Number = (currentTicks - ticks) / 1000;
			
      // For the heck of it, you can also determine FPS
      framesPerSecond = 1 / secondsPerFrame;
			
      // Set this var for the next iteration
      ticks = currentTicks;
	
      // Increment the timer
      frameTimer += secondsPerFrame;
			
      // Compare the frameTimer value against the number of seconds you want each frame to display
      if(frameTimer &gt; 0.5) {
        // Reset the frame timer
        frameTimer = 0;
				
        // Hide the first frame
        this.character.getChildAt(0).visible = false;
				
        // Move the last frame up to be first
        this.character.setChildIndex(this.character.getChildAt(2), 0);
				
        // Show the new first frame
        this.character.getChildAt(0).visible = true;
      }
    }
  }
}
</pre>
<p><a href='http://www.bitter-gamer.com/wp-content/uploads/2009/03/animationexample.zip'>Download the code, .swf, and (bad) graphics.</a></p>
<p>In addition to the <code>setChildIndex()</code> function that swaps the depth of each animation frame, there's also some code that obtains the current frame rate, which helps set the speed of the animation. In some games, the motion of all the characters can be limited by a number derived by the frame rate, which helps ensure that the game runs the same speed on different computers. This isn't totally necessary in Flash, however, since it's possible to limit frame rate by using <code>[SWF(frameRate='XX')]</code> at the beginning of your Actionscript package. </p>
