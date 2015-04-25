---
layout: post
status: publish
published: true
title: Detecting touch events in cocos2d-iphone
author:
  display_name: nathan
  login: nathan
  email: ndemick@gmail.com
  url: ''
author_login: nathan
author_email: ndemick@gmail.com
wordpress_id: 51
wordpress_url: http://ganbarugames.com/?p=51
date: '2010-12-13 08:00:33 -0500'
date_gmt: '2010-12-13 13:00:33 -0500'
categories:
- Programming
- Tutorial
tags:
- programming
- iOS
- cocos2d
- tutorial
- user input
- touchscreen
comments:
- id: 7
  author: cocos2d Game Tutorial - Multitouch Asteroids (Part 1/3) | Ganbaru Games
  author_email: ''
  author_url: http://ganbarugames.com/2010/12/cocos2d-game-tutorial-multitouch-asteroids-part-one/
  date: '2010-12-27 13:27:11 -0500'
  date_gmt: '2010-12-27 18:27:11 -0500'
  content: '[...] moving. To move it, we&#8217;ll have to implement the three touch-detecting
    methods talked about in my previous tutorial, and determine how the user input
    will move the ship. The scheme I decided upon is pinch &amp; [...]'
- id: 29
  author: Infotechswati
  author_email: infotechswati@gmail.com
  author_url: ''
  date: '2011-04-21 10:15:00 -0400'
  date_gmt: '2011-04-21 10:15:00 -0400'
  content: nice tutorial
- id: 39
  author: Dom
  author_email: dom.wickins@gmail.com
  author_url: ''
  date: '2011-08-06 05:21:00 -0400'
  date_gmt: '2011-08-06 05:21:00 -0400'
  content: "Hey\n\ngreat tutorial, really helping. just wondering though, how would
    i go about adding or implementing a touch event to move the sprite around the
    screen with a single touch aswell as being able to pinch as per example.\n\ni
    thought something like this...\n\nif ([touchArray count] &lt; 2)\n        {\n       
    \n            UITouch *fingerOne = [touchArray objectAtIndex:0];\n        \n           
    CGPoint location = [fingerOne locationInView:fingerOne.view];\n        \n           
    [mySprite setPosition:ccp(location.x , location.y )];\n\n        }\n\n it&#039;s
    not working though, am i way off the mark?,  I&#039;m a complete noob. any help
    would be really appreciated\n"
- id: 40
  author: Nathan
  author_email: ndemick@gmail.com
  author_url: http://ganbarugames.com
  date: '2011-08-07 00:26:00 -0400'
  date_gmt: '2011-08-07 00:26:00 -0400'
  content: |-
    Hmm, that looks OK off the top of my head. One thing that's helpful for me is to debug with NSLog statements. It's not the most efficient, but it's pretty easy to do. In this case you could put a log statement like this inside your if clause, to make sure that it's being evaluated in the way you expect: NSLog(@"Touch position: %i, %i", location.x, location.y);

    That might help you figure out if the problem is with the array of touch objects or with the sprite.
- id: 41
  author: Dom
  author_email: dom.wickins@gmail.com
  author_url: ''
  date: '2011-08-08 21:54:00 -0400'
  date_gmt: '2011-08-08 21:54:00 -0400'
  content: |+
    hey, thanks so much for replying, really appreciated.... i managed to get it working, i put the if statement directly after "NSArray *touchArray = [touches allObjects];" and it works, instead of at the end of the previous if statements (idiot i am) although I've hit another small issue, the touch seem inverted, if i move the "finger" up in simulator the sprite moves down and the same the opposite way round. left and right is absolutely fine.... i'll go over the code and see if i can spot the issue.

    thanks again for your help.

- id: 42
  author: Nathan
  author_email: ndemick@gmail.com
  author_url: http://ganbarugames.com
  date: '2011-08-09 16:48:00 -0400'
  date_gmt: '2011-08-09 16:48:00 -0400'
  content: "You know what, I think that I might have mislead you with one of the comments
    in my example code. OpenGL coordinates and UIKit coordinates have an inverted
    y-axis. So you should still run the touch object through the cocos2d Director's
    converter method like so:  \n\nlocation = [[CCDirector sharedDirector] convertToGL:location];
    \ \n\nI wrongly put in a comment that you only have to do that to convert from
    portrait -&gt; landscape orientation. In reality, the touch object is provided
    by UIKit, and is then being passed to cocos2d (OpenGL), so you have to convert
    it. Sorry about the confusion, that was my mistake :/"
- id: 43
  author: Dom
  author_email: dom.wickins@gmail.com
  author_url: ''
  date: '2011-08-10 03:24:00 -0400'
  date_gmt: '2011-08-10 03:24:00 -0400'
  content: |-
    i don't think you mislead me, infact i only vaguely remember skimming across that comment. I'm extremely new to cocos2d (and programming in general) and am just trying to pick up the basics before undertaking anything major. i tryed your method to convert but couldn't get it to work, i eventually managed to get the sprite moving the right way by using this. btw everything's running in portrait.

    CGPoint location = [self convertTouchToNodeSpace:fingerOne];

    although it seems to make pinching less accurate, as the "fingers" in the simulator appear in random locations. most probably my fault ;)
- id: 99
  author: Asdadadad
  author_email: asdadadad@hotmial.com
  author_url: ''
  date: '2012-06-12 18:30:00 -0400'
  date_gmt: '2012-06-12 22:30:00 -0400'
  content: |-
    Great Tutorial! It gave me some basic gasp on touch events!
    Thanks 
    regards
- id: 117
  author: DMike
  author_email: mikdurocher@earthlink.net
  author_url: ''
  date: '2013-03-22 04:20:00 -0400'
  date_gmt: '2013-03-22 08:20:00 -0400'
  content: Sir, God Bless You.  I have been scouring the internet looking for an answer
    to this question and yours was the only one that was succinct and intelligible.  Most
    other posts were sending me to added classes that did not seem to work or added
    so much extra code as to be ridiculous.  Thank you once again.
- id: 121
  author: Douglas_Lemus_13062
  author_email: douglaslemusm@gmail.com
  author_url: ''
  date: '2013-06-18 17:45:00 -0400'
  date_gmt: '2013-06-18 21:45:00 -0400'
  content: hello, I have a question, need to do a memory game, well my question is
    how I can select a CCSprite and then you can select another?
- id: 138
  author: iPhone Development | Pearltrees
  author_email: ''
  author_url: http://www.pearltrees.com/divyeshaegis/iphone-development/id13241781/item134055609
  date: '2015-01-06 08:32:09 -0500'
  date_gmt: '2015-01-06 13:32:09 -0500'
  content: '[&#8230;] Detecting touch events in cocos2d-iphone | Ganbaru Games. In
    the previous tutorial I wrote about scenes and layers, the basic structural classes
    of a cocos2d app. [&#8230;]'
---
<p>In the <a href="http://ganbarugames.com/2010/12/understanding-scenes-in-cocos2d-iphone/">previous tutorial</a> I wrote about scenes and layers, the basic structural classes of a cocos2d app. In this next installment, I'm going to talk about putting some actual content into your scenes and responding to user input. </p>
<p>If we're interested in getting user input, first we should create something that responds to that input. In most cases, this will be a sprite object. A sprite is usually a representation of an entity in your game system, such as the player, an enemy, or a power-up. When you create a new sprite, you give the sprite an image as a parameter. After you add the sprite to a containing layer, that image then appears on the screen, and you can move it around by manipulating properties of the sprite object. A simple example:</p>
<pre class="brush:cpp">
CCSprite *mySprite = [CCSprite spriteWithFile:@"Icon.png"];
[mySprite setPosition:ccp(160, 240)];
[self addChild:mySprite z:1];
</pre>
<p>This is the easiest way to get an image onto the screen. Once you've created a sprite, you can transform it in various ways.</p>
<pre class="brush:cpp">
[mySprite setPosition:ccp(30, 30)];      // Change position
[mySprite setScale:2.0];                       // Make 2x bigger
[mySprite setRotation:180.0];             // Rotate
</pre>
<p>Wait, this post was supposed to be about detecting user touches, right? OK, let's create an example app that will use the ubiquitous "pinch" gesture to scale a sprite that's displayed in the center of the screen. </p>
<p>Create a new project using the regular cocos2d template. I named mine "TouchExample." Open up the Classes group in the Groups &amp; Files sidebar, click on the HelloWorldScene.h file, then modify the class declaration as follows:</p>
<pre class="brush:cpp">
@interface HelloWorld : CCLayer
{
	CCSprite *mySprite;
}

@property (nonatomic, retain) CCSprite *mySprite;

// returns a Scene that contains the HelloWorld as the only child
+(id) scene;

@end
</pre>
<p>Basically what you're doing here is creating a reference to a sprite object that can be accessed from any method in the HelloWorld layer. That means you can create the sprite in your "init" method, then reference it and move it around in a different method later. Next, open the HelloWorldScene.m file. Navigate to the "init" method, and replace the code there:</p>
<pre class="brush:cpp">
// Creates "setters" and "getters" for this sprite
@synthesize mySprite;

- (id)init
{
	if ((self = [super init])) 
        {
		// ask director the the window size
		CGSize size = [[CCDirector sharedDirector] winSize];

		// Set layer to respond to touch events
		[self setIsTouchEnabled:TRUE];
		
		// Create sprite and add to layer
		mySprite = [CCSprite spriteWithFile:@"Icon.png"];
		[mySprite setPosition:ccp(size.width / 2, size.height / 2)];
		[self addChild:mySprite];
	}
	return self;
}
</pre>
<p>What we're doing here is telling the layer that we want it to respond to touches. Then we create a sprite using the app icon and slap it in the center of the screen. Next, add the following methods after "init." When you called the "setIsTouchEnabled" method of the layer in the init method, the following three methods are available to be overridden with your own logic.</p>
<pre class="brush:cpp">
- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	NSLog(@"Touches began!");
}

// Override the "ccTouchesMoved:withEvent:" method to add your own logic
- (void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	// This method is passed an NSSet of touches called (of course) "touches"
	// "allObjects" returns an NSArray of all the objects in the set
	NSArray *touchArray = [touches allObjects];

	// Only run the following code if there is more than one touch
	if ([touchArray count] > 1)
	{
		// We're going to track the first two touches (i.e. first two fingers)
		// Create "UITouch" objects representing each touch
		UITouch *fingerOne = [touchArray objectAtIndex:0];
		UITouch *fingerTwo = [touchArray objectAtIndex:1];
		
		// Convert each UITouch object to a CGPoint, which has x/y coordinates we can actually use
		CGPoint pointOne = [fingerOne locationInView:[fingerOne view]];
		CGPoint pointTwo = [fingerTwo locationInView:[fingerTwo view]];
		
		// The touch points are always in UIKit coordinates
		// You will need to convert them to OpenGL coordinates (which have an inverted y-axis)
		pointOne = [[CCDirector sharedDirector] convertToGL:pointOne];
		pointTwo = [[CCDirector sharedDirector] convertToGL:pointTwo];

		// Get the distance between the touch points
		float distance = sqrt(pow(pointOne.x - pointTwo.x, 2.0) + pow(pointOne.y - pointTwo.y, 2.0));
		
		// Scale the distance based on the overall width of the screen (multiplied by a constant, just for effect)
		float scale = distance / [CCDirector sharedDirector].winSize.width * 5;
		
		// Set the scale factor of the sprite
		[mySprite setScale:scale];
	}
}

- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	NSLog(@"Touches ended!");
}
</pre>
<p>You can see that there are three phases we can use to get info about user touches: touchesBegan, touchesMoved, and touchesEnded. Right now we're only concerned about what happens when touches move around the screen, so the other two methods just have logging statements in them to prove that they're firing.</p>
<p>The ccTouchesMoved: method is automatically given an <a href="http://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/Classes/NSSet_Class/Reference/Reference.html">NSSet</a> of <a href="http://developer.apple.com/library/ios/#documentation/uikit/reference/UITouch_Class/Reference/Reference.html">UITouch</a> objects when it is called. You can see in the commented code how those objects are converted down into <a href="http://developer.apple.com/library/mac/#documentation/GraphicsImaging/Reference/CGGeometry/Reference/reference.html">CGPoint</a> structs that contain regular Cartesian coordinates, which can then be used in a meaningful way. If your game is set up to run in landscape mode (or can toggle between portrait and landscape), you'll need to send the CGPoint coordinates to the <a href="http://www.cocos2d-iphone.org/api-ref/0.99.5/interface_c_c_director.html">CCDirector</a> to be converted to the current orientation. However, if your game is portrait-only (like, <em>*ahem*,</em> <a href="/nonogram-madness/" title="Nonogram Madness">Nonogram Madness</a>), you can omit that step.</p>
<p>Once the x/y values of the two touch points are obtained, they get plugged into the Pythagorean theorem to find the distance between them. That distance is scaled by the total screen width, then applied to the sprite as a scaling factor.</p>
<p>The last step that needs to be taken is that we need to tell the app that it should recognize multiple touches. To do that, open up TouchExampleAppDelegate.m and find where the OpenGL view is created (do a search for "EAGLView *glView"). After the long initialization, type:</p>
<pre class="brush:cpp">
[glView setMultipleTouchEnabled:TRUE];
</pre>
<p>Build &amp; run the project in the iOS simulator, and hold down the Option key to make two touch points with your mouse. You can see that the sprite scales up and down based on the distance between the touches. </p>
<p>Congrats! You have the basics of getting user input in your cocos2d app. Play around with the project and see what other sorts of ways you can manipulate the sprite. One problem with this example is that the sprites' scale factor is reset each time you touch the screen again. An interesting reader exercise might be to retain the scale factor, so that the interaction feels more "natural." I've attached my solution (which is probably needlessly complex) in an <a href='http://ganbarugames.com/wp-content/uploads/2010/12/TouchExample.zip' title="Xcode project file">Xcode project file</a>.</p>
