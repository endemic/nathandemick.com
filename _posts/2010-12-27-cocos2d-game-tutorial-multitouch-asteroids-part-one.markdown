---
layout: post
status: publish
published: true
title: cocos2d Game Tutorial - Multitouch Asteroids (Part 1)
author:
  display_name: nathan
  login: nathan
  email: ndemick@gmail.com
  url: ''
author_login: nathan
author_email: ndemick@gmail.com
wordpress_id: 122
wordpress_url: http://ganbarugames.com/?p=122
date: '2010-12-27 13:27:01 -0500'
date_gmt: '2010-12-27 18:27:01 -0500'
categories:
- Programming
- Tutorial
tags:
- programming
- cocos2d
- tutorial
- user input
- touchscreen
- objective-c
- CCSprite
comments:
- id: 19
  author: Clean COCOS &amp; BOX2D project | W2OM - iPhone by code
  author_email: ''
  author_url: http://w2om.com/clean-cocos-box2d-project/
  date: '2011-02-22 06:57:34 -0500'
  date_gmt: '2011-02-22 11:57:34 -0500'
  content: '[...] &#8211; You can look at this nice game example    This entry was
    posted in Code Samples. Bookmark the permalink.    &larr; BOX2D [...]'
- id: 52
  author: Multitouch Asteroids game in Cocos2D-x
  author_email: ''
  author_url: http://gameit.ro/2011/09/multitouch-asteroids-game-in-cocos2d-x/
  date: '2011-09-18 15:01:11 -0400'
  date_gmt: '2011-09-18 19:01:11 -0400'
  content: '[...] stumbled upon an Asteroids game tutorial from Ganbaru Games from
    December 2010. Asteroids game clones have always served as excellent teaching
    guides for [...]'
- id: 53
  author: Ricochet Robots Site - Documentación en blogs &#8230;
  author_email: ''
  author_url: http://www.ricochetrobot.net/?p=30
  date: '2011-09-18 20:50:40 -0400'
  date_gmt: '2011-09-19 00:50:40 -0400'
  content: '[...] http://ganbarugames.com/2010/12/cocos2d-game-tutorial-multitouch-asteroids-part-one/
    [...]'
- id: 69
  author: '[Share] asteroid &#8211; Demo plus tutorials (cocos2d) | SuperSuRaccoon&#039;s
    World'
  author_email: ''
  author_url: http://www.supersuraccoon-cocos2d.com/2011/11/22/share-asteroid-demo-tutorials-cocos2d/
  date: '2011-11-22 09:40:11 -0500'
  date_gmt: '2011-11-22 14:40:11 -0500'
  content: '[...] [Share] asteroid &#8211; Demo plus tutorials (cocos2d)  Posted on
    Tuesday November 22nd, 2011 by SuperSuRaccoon   A nice simple demo called &#8220;asteroid&#8221;
    along with detailed tutorials are available: Check it On Ganbarugames.com &#8230;
    [...]'
- id: 85
  author: stcredzero
  author_email: stcredzero@gmail.com
  author_url: ''
  date: '2012-02-29 15:39:00 -0500'
  date_gmt: '2012-02-29 20:39:00 -0500'
  content: 'I have the ship rendering and moving (by hard-coding an initial velocity.x
    and velocity.y) but the methods ccTouchesBegan:withEvent: ccTouchesMoved:withEvent:
    and ccTouchesEnded:withEvent: never, ever fire. I have breakpoints in them, and
    those methods are never called.'
- id: 86
  author: Nathan
  author_email: ndemick@gmail.com
  author_url: http://ganbarugames.com
  date: '2012-02-29 15:54:00 -0500'
  date_gmt: '2012-02-29 20:54:00 -0500'
  content: You'll want to make sure you call [self setIsTouchEnabled:YES]; in the
    init method of the cocos2d layer. I updated the example code to add that in.
- id: 87
  author: stcredzero
  author_email: stcredzero@gmail.com
  author_url: ''
  date: '2012-02-29 16:25:00 -0500'
  date_gmt: '2012-02-29 21:25:00 -0500'
  content: |-
    I fixed this by adding: 








    self.isTouchEnabled = YES;to the implementation of GameLayer in the init method. 
---
<p>So I've posted some general-purpose tutorials about some of the lower level components of cocos2d, and I figure it's as good of a time as any to have a tutorial that makes something "real." So, for this next series, we're going to concentrate on making a full-fledged game - an Asteroids clone. The game logic that controls Asteroids is pretty darn simple, which means that most of the discussion will be about cocos2d and Objective-C. We'll also discuss adapting a game that uses a traditional control scheme (joystick & buttons) to use a touchscreen instead.</p>
<p>Let's get started! Create a new Xcode project that uses a cocos2d template. Now, let's first think about the most basic game objects in Asteroids that need to be represented on the screen. They are, of course, the player's ship, the player's bullets, and the asteroids (yes, in the real game there are aliens as well, but for now let's work with the smallest number of objects we need, just for simplicity). Our first task will be to create a ship object, place it on the screen, and have it move around based on user input. Each object in our game will be represented by a <code>CCSprite</code>, so I've decided to create subclasses of <code>CCSprite</code> to represent the three objects in our game. Right-click on the Resources group in your Xcode sidebar, and add a new file. Choose the cocos2d template that extends <code>CCSprite</code>, and name the file "ship.m." Now you have a basic class that will be used to represent the player ship. However, at this point the class is the exact same as a <code>CCSprite</code>... let's add some additional code to it that will be useful. For example, we want to let the ship have a "velocity" property, and then make the ship automatically move based on its' velocity. Also (if you remember Asteroids), when an object goes off the game screen, it reappears on the other side. It'd be nice if that happened automatically, and we didn't have to put logic in the game loop that checks each each visible object. Modify your "ship.h" file to look something like this:</p>
<pre class="brush:cpp">
#import "cocos2d.h"

@interface Ship : CCSprite 
{
	// Store how fast the ship is moving
	CGPoint velocity;
}

@property CGPoint velocity;

// Have to override this method in order to subclass CCSprite
- (id)initWithTexture:(CCTexture2D*)texture rect:(CGRect)rect;

// This method gets called each time the object is updated in the game loop
- (void)update:(ccTime)dt;

@end
</pre>
<p>You can see that this new class has access to all the features of a regular sprite, but we're also giving it a new property, "velocity." A <code>CGPoint</code> is a struct that has x/y values, so it's real handy to use when dealing with Cartesian coordinates. For example, we could get the horizontal velocity of the ship by accessing <code>ship.velocity.x</code>. There are also two methods declared here that override some of <code>CCSprite</code>'s default methods. The first method is <a href="http://www.cocos2d-iphone.org/wiki/doku.php/prog_guide:sprites">required if you want to subclass a sprite</a>. The second is where we'll put all the custom logic that the ship requires. Now let's take a look at the "ship.m" implementation file.</p>
<pre class="brush:cpp">
#import "Ship.h"

@implementation Ship

// Automatically create "setters" and "getters" for the velocity property
@synthesize velocity;

// The init method we have to override - http://www.cocos2d-iphone.org/wiki/doku.php/prog_guide:sprites (bottom of page)
- (id)initWithTexture:(CCTexture2D*)texture rect:(CGRect)rect
{
	// Call the init method of the parent class (CCSprite)
	if ((self = [super initWithTexture:texture rect:rect]))
	{
		// The only custom stuff here is scheduling an update method
		[self scheduleUpdate];
	}
	return self;
}

// Gets updated every game loop iteration
- (void)update:(ccTime)dt
{
	// Move the ship based on the "velocity" variable
	[self setPosition:ccp(self.position.x + velocity.x, self.position.y + velocity.y)];

	// Get window size
	CGSize windowSize = [CCDirector sharedDirector].winSize;
	
	// If object moves off the bounds of the screen, make it appear on the other size
	if (self.position.x < 0)
		[self setPosition:ccp(windowSize.width, self.position.y)];
	else if (self.position.x > windowSize.width)
		[self setPosition:ccp(0, self.position.y)];
	
	if (self.position.y < 0)
		[self setPosition:ccp(self.position.x, windowSize.height)];
	else if (self.position.y > windowSize.height)
		[self setPosition:ccp(self.position.x, 0)];
}
@end
</pre>
<p>The point of interest here is the <code>[self scheduleUpdate]</code> method, which will automatically look for a method called "update," and then fire it every time the game loop runs. You can see that most of the code in "update" is pretty basic game logic: the ship gets moved based on its' velocity, and if it goes off the edge of the screen, it loops around to the other side.</p>
<p>Now let's create a new scene/layer where we can display our brand-spankin'-new "ship" class. Create a new file, have it subclass <code>CCLayer</code>, and name it something like "GameScene." I'm basically copy/pasting the code that is used in the default "HelloWorldScene.m" file in order to create a new scene. Make "GameScene.h" look like this:</p>
<pre class="brush:cpp">
#import "cocos2d.h"
#import "Ship.h"

@interface GameLayer : CCLayer
{
	Ship *ship;
}

+ (id)scene;

@end
</pre>
<p>Now open up "GameScene.m" and we'll create the code that will initialize a Ship object and display it on the screen. At this point you should probably draw a ship graphic for your project (I use <a href="http://flyingmeat.com/acorn/">Acorn</a>, which has a free trial and doesn't expire). Make the ship's nose point to the right, since the ship's rotation will start off at zero (think about the unit circle).  Save the image in your project's Resources folder, then add it to the project by right-clicking the Resources group in your project sidebar, and choosing "Add existing file." Since the file is already in the project's directory structure, you can leave the "Copy to project folder" checkbox unchecked. Uhh, so what was I saying? Right, GameScene.m:</p>
<pre class="brush:cpp">
#import "GameScene.h"
#import "Ship.h"

@implementation GameLayer

+ (id)scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	GameLayer *layer = [GameLayer node];
	
	// add layer as a child to scene
	[scene addChild:layer];
	
	// return the scene
	return scene;
}

- (id)init
{
	if ((self = [super init]))
	{
		// Set layer to respond to touch events
		[self setIsTouchEnabled:YES];
		
		// Get window size
		CGSize windowSize = [CCDirector sharedDirector].winSize;
		
		// Create ship object, position it, then add to layer
		ship = [Ship spriteWithFile:@"ship.png"];
		ship.position = ccp(windowSize.width / 2, windowSize.height / 2);
		[self addChild:ship];

	}
	return self;
}
@end
</pre>
<p>This does exactly what it looks like: instantiates our Ship class and displays it on the screen. If you build and run the project now, you'll see the ship smack in the center of the screen. Pretty boring, though... right now the ship has no way of moving. To move it, we'll have to implement the three touch-detecting methods talked about in <a href="http://ganbarugames.com/2010/12/detecting-touch-events-in-cocos2d-iphone/">my previous tutorial</a>, and determine how the user input will move the ship. The scheme I decided upon is pinch &amp; rotate to rotate the ship, swipe to move the ship in the direction it's facing, and a single tap to shoot. Notice in the following code there are some variables that store the previous values of certain bits of user input. This is something that's necessary with movement-based input. With button input, it's obvious what the player wants to do when they press a button, but when they move their finger on the screen, it's not so obvious. Are they trying to swipe or tap? During each iteration of the game loop, we only have the current position of the users' fingers; we don't know anything about what they did a second before. So, we store some previous values to figure out if a player is tapping or swiping, as well as which direction to rotate the ship. Open up "GameScene.h" and modify it to look like the following:</p>
<pre class="brush:cpp">
#import "cocos2d.h"
#import "Ship.h"

@interface GameLayer : CCLayer
{
	Ship *ship;
	
	// To determine rotation
	float previousTouchAngle, currentTouchAngle;
	
	// To determine movement/shooting
	CGPoint startTouchPoint, endTouchPoint;
}

+ (id)scene;

@end
</pre>
<p>Now we'll add the movement-detecting methods in "GameScene.m." You can put these anywhere between <code>@implementation GameLayer</code> and <code>@end</code>.</p>
<pre class="brush:cpp">
- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	// This method is passed an NSSet of touches called (of course) "touches"
	// The "allObjects" method returns an NSArray of all the objects in the set
	NSArray *touchArray = [touches allObjects];
	
	// Only run the following code if there is more than one touch
	if ([touchArray count] > 0)
	{
		// Create "UITouch" objects representing each touch
		UITouch *fingerOne = [touchArray objectAtIndex:0];
		
		// Convert each UITouch object to a CGPoint, which has x/y coordinates we can actually use
		CGPoint pointOne = [fingerOne locationInView:[fingerOne view]];
		
		// The touch points are always in "portrait" coordinates - convert to landscape
		pointOne = [[CCDirector sharedDirector] convertToGL:pointOne];
		
		// We store the starting point of the touch so we can determine whether the touch is a swipe or tap.
		// A tap shouldn't move, so we compare the distance of the starting/ending touches, and if the distance is
		// small enough (we account for a bit of movement, just in case), the input is considered a tap
		startTouchPoint = pointOne;
		
		// Only run the following code if there is more than one touch
		if ([touchArray count] > 1)
		{
			// Create "UITouch" objects representing each touch
			UITouch *fingerTwo = [touchArray objectAtIndex:1];
			
			// Convert each UITouch object to a CGPoint, which has x/y coordinates we can actually use
			CGPoint pointTwo = [fingerTwo locationInView:[fingerTwo view]];
			
			// The touch points are always in "portrait" coordinates - convert to landscape
			pointTwo = [[CCDirector sharedDirector] convertToGL:pointTwo];
			
			// Initialize the variables used to store the angle of rotation derived from the user's fingers
			currentTouchAngle = previousTouchAngle = CC_RADIANS_TO_DEGREES(atan2(pointOne.x - pointTwo.x, pointOne.y - pointTwo.y));
		}
	}
}

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
		
		// The touch points are always in "portrait" coordinates - you will need to convert them if in landscape (which we are)
		pointOne = [[CCDirector sharedDirector] convertToGL:pointOne];
		pointTwo = [[CCDirector sharedDirector] convertToGL:pointTwo];
		
		// Get the angle that's created by the user's two fingers - see http://en.wikipedia.org/wiki/Atan2
		currentTouchAngle = CC_RADIANS_TO_DEGREES(atan2(pointOne.x - pointTwo.x, pointOne.y - pointTwo.y));
		
		// Compare with the previous angle, to decide whether the change is positive or negative.
		float difference = currentTouchAngle - previousTouchAngle;
		
		// The ship is then rotated by that difference
		ship.rotation += difference;

		// Store the current angle variable to be used again on the next loop iteration
		previousTouchAngle = currentTouchAngle;
	}
}

- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	// Get array of touch objects
	NSArray *touchArray = [touches allObjects];
	
	// Only run this if there's one touch
	if ([touchArray count] == 1)
	{
		// Create "UITouch" objects representing each touch
		UITouch *fingerOne = [touchArray objectAtIndex:0];
		
		// Convert each UITouch object to a CGPoint, which has x/y coordinates we can actually use
		CGPoint pointOne = [fingerOne locationInView:[fingerOne view]];
		
		// The touch points are always iin "portrait" coordinates - convert to landscape
		pointOne = [[CCDirector sharedDirector] convertToGL:pointOne];
		
		// Set the variable that stores the ending touch point
		endTouchPoint = pointOne;
		
		// Get the distance that the user's finger moved during this touch
		float distance = sqrt(pow(endTouchPoint.x - startTouchPoint.x, 2) + pow(endTouchPoint.y - startTouchPoint.y, 2));
		
		// If the distance moved (in pixels) is small enough, consider the gesture a tap
		if (distance < 5)
		{
			NSLog(@"Shoot!");
		}
		// Otherwise, it's a swipe
		else
		{
			// Use distance of swipe as a multiplier for the ship velocity (longer swipe, go faster)
			ship.velocity = ccp(cos(CC_DEGREES_TO_RADIANS(ship.rotation)) * distance / 100, -sin(CC_DEGREES_TO_RADIANS(ship.rotation)) * distance / 100);
		}

	}
}
</pre>
<p>This is a lot to go through, but if you read through the code, it should be easy to follow the flow. The "ccTouchesBegan" method simply stores some values based on how many touches are detected. The "ccTouchesMoved" method looks to see if the player is using a pinch gesture, and if they are, it figures out the angle between the two fingers (read up on the <a href="http://en.wikipedia.org/wiki/Atan2">atan2 function</a>; it's super useful for 2D games) and rotates the ship. "ccTouchesEnded" checks where the player's finger left the screen; if it's in roughly the same place as where it first touched, that's interpreted as a tap, which shoots. Otherwise the player swiped their finger across the screen, which means they want to move. The ship's current angle is obtained, and then the ship's velocity property is set using that angle multiplied by how far the player moved their finger.</p>
<p>Build and run the program, then try using some of the gestures we programmed (hold the option key to simulate pinch/rotate). Hopefully you should see the ship rotating and moving (as well as seeing log messages when you tap). The ship will also wrap around to the opposite side of the screen instead of disappearing when it goes off the edge. Remember, the ship's movement and position wrapping happen automatically due to the "update" method that we programmed into the class. You don't have to worry about any of that in the main game loop.</p>
<p>And, that's a wrap for this installment of the tutorial. Next time we'll add asteroids and bullets, as well as collision detection. Having problems, or were any sections of the tutorial unclear? Let me know in the comments, and I'll try to clarify. Thanks for reading!</p>
<p>(<strong>Update:</strong> continue reading <a href="/2011/01/cocos2d-game-tutorial-multitouch-asteroids-part-2/">part two</a> and <a href="/2011/03/cocos2d-game-tutorial-multitouch-asteroids-part-3/">part three</a>!)</p>
