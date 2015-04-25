---
layout: post
status: publish
published: true
title: cocos2d Game Tutorial – Multitouch Asteroids (Part 2)
author:
  display_name: nathan
  login: nathan
  email: ndemick@gmail.com
  url: ''
author_login: nathan
author_email: ndemick@gmail.com
wordpress_id: 171
wordpress_url: http://ganbarugames.com/?p=171
date: '2011-01-03 08:00:19 -0500'
date_gmt: '2011-01-03 13:00:19 -0500'
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
- id: 16
  author: Ffasltd
  author_email: ffasltd@yahoo.co.uk
  author_url: ''
  date: '2011-02-08 10:20:00 -0500'
  date_gmt: '2011-02-08 10:20:00 -0500'
  content: |
    Hi
    Is it possible to email you re the above and some questions ?
    Thanks
- id: 17
  author: butr0s
  author_email: ndemick@gmail.com
  author_url: http://nathandemick.com
  date: '2011-02-08 10:50:00 -0500'
  date_gmt: '2011-02-08 10:50:00 -0500'
  content: Sure, info@ganbarugames.com. I can't promise anything though =]
- id: 21
  author: Joey
  author_email: apixxx@gmail.com
  author_url: ''
  date: '2011-02-25 20:48:00 -0500'
  date_gmt: '2011-02-25 20:48:00 -0500'
  content: Awesome tutorial helped me alot!! Keep up the good work!!
- id: 23
  author: butr0s
  author_email: ndemick@gmail.com
  author_url: http://nathandemick.com
  date: '2011-03-10 16:49:00 -0500'
  date_gmt: '2011-03-10 16:49:00 -0500'
  content: Thanks for reading! I plan on updating with more tutorials, so check back
    for more cocos2d + Obj-C info.
---
<p>Bokay, so in the <a href="/2010/12/cocos2d-game-tutorial-multitouch-asteroids-part-one/">previous tutorial</a> we created a good base for an Asteroids-style game &mdash; we created a Ship object, and got it to respond to user input. But! There's no conflict yet, and therefore not much of a game. In this installment we're going to create Bullet and Asteroid classes, so you can actually shoot at something! The excitement is <em>palpable</em>. </p>
<p>Open up the project you previously created. If you guessed that we're going to start by adding two new sets of .h/.m files, then you are correct. Right-click on the Classes group in your project sidebar, and choose Add > New File. Use the "cocos2d Node class" template, have it subclass CCSprite, and name it "Asteroid.m". Do the same thing again, except name the second file "Bullet.m". These two classes will be very similar to the Ship class we already created, so don't worry too much. </p>
<p>So let's think about what we need to have our bullet and asteroid objects do. They both need to follow the same movement rules as the ship &mdash; when going off the edge of the screen, they re-appear on the other side. Well, that's easy... we can just re-use the code we wrote for the ship. The asteroid object also needs to know if it's "small," "medium," or "large." Remember that if you destroy a large asteroid, it splits into two medium asteroids, et cetera. The asteroid should also detect if it collides with a bullet or the ship, so we should have a collision detection method. As you can see from the following code, the "Asteroid.h" header is almost the same as "Ship.h," with the addition of the property/method that we discussed.</p>
<pre class="brush:cpp">
//  Asteroid.h

#import "cocos2d.h"

@interface Asteroid : CCSprite 
{
	// Stores the size of the asteroid - values will be 1, 2, or 3
	int size;
	
	// A struct that holds X/Y values that will be used for the asteroid's speed
	CGPoint velocity;
}

// Declare properties so setters/getters can be automatically synthesized
@property int size;
@property CGPoint velocity;

// Declare methods
- (id)initWithTexture:(CCTexture2D *)texture rect:(CGRect)rect;
- (void)update:(ccTime)dt;
- (bool)collidesWith:(CCSprite *)obj;

@end
</pre>
<p>The corresponding implementation file, "Asteroid.m," is again almost the same as "Ship.m". The only changes here are the inclusion of a line of code to make each asteroid spin as it moves, as well as the collision detection method. The collision detection uses some of Apple's built-in geometry functions to create bounding rectangles around two objects, then passes them through a function to detect intersections. </p>
<pre class="brush:cpp">
//  Asteroid.m

#import "Asteroid.h"

@implementation Asteroid

// Create setters/getters for these properties
@synthesize size, velocity;

- (id)initWithTexture:(CCTexture2D *)texture rect:(CGRect)rect
{
	if ((self = [super initWithTexture:texture rect:rect]))
	{
		// Make sure to schedule the "update" method to run
		[self scheduleUpdate];
	}
	return self;
}

- (void)update:(ccTime)dt
{
	// Rotate (based on time interval between each frame)
	[self setRotation:self.rotation + (float)dt * 15];
	
	// Move
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

// Super-basic AABB collision detection
- (bool)collidesWith:(CCSprite *)obj
{
	// Create two rectangles with CGRectMake, using each sprite's x/y position and width/height
	CGRect ownRect = CGRectMake(self.position.x - (self.contentSize.width / 2), self.position.y - (self.contentSize.height / 2), self.contentSize.width, self.contentSize.height);
	CGRect otherRect = CGRectMake(obj.position.x - (obj.contentSize.width / 2), obj.position.y - (obj.contentSize.height / 2), obj.contentSize.width, obj.contentSize.height);
	
	// Feed the results into CGRectIntersectsRect() which tells if the rectangles intersect (obviously)
	return CGRectIntersectsRect(ownRect, otherRect);
}
@end
</pre>
<p>Now let's take a look at the bullet object. Again, it's mostly the same as the asteroid and ship, but we want our bullets to disappear after they travel a certain distance... otherwise they'd just continue to float around forever until they hit something. I guess that would be true to life, but it would make the game too easy! So for each bullet, we'll store the total distance it's traveled since it was created, as well as store an "expired" flag. Whenever the bullet moves, we'll check to see if the accumulated distance is greater than a certain number (I'm using half of the screen width), and if it is, then the bullet is considered expired. It'll then be up to the game loop to look at that flag and remove the bullet.</p>
<pre class="brush:cpp">
//  Bullet.h

#import "cocos2d.h"

@interface Bullet : CCSprite 
{
	// Stores how far the bullet has moved!
	float distanceMoved;
	
	// How fast the bullet moves
	CGPoint velocity;
	
	// Whether or not the bullet has traveled so far that it disappears
	bool expired;
}

// Declare properties so setters/getters can be automatically synthesized
@property float distanceMoved;
@property CGPoint velocity;
@property bool expired;

// Declare methods
- (id)initWithTexture:(CCTexture2D *)texture rect:(CGRect)rect;
- (void)update:(ccTime *)dt;

@end
</pre>
<p>In the "update" method of the bullet, we'll perform the movement and distance checks. If you remember your geometry, this code should seem familiar. Also, in the "initWithTexture" method, we'll also initialize the variable that stores the distance the bullet has traveled, setting it to zero.</p>
<pre class="brush:cpp">
//  Bullet.m

#import "Bullet.h"

@implementation Bullet

// Create setters/getters for these properties
@synthesize distanceMoved, velocity, expired;

- (id)initWithTexture:(CCTexture2D *)texture rect:(CGRect)rect
{
	if ((self = [super initWithTexture:texture rect:rect]))
	{
		// Schedule update for this object
		[self scheduleUpdate];
		
		// Initialize the distance the bullet has moved
		distanceMoved = 0;
	}
	return self;
}

- (void)update:(ccTime *)dt
{
	// Get window size
	CGSize windowSize = [CCDirector sharedDirector].winSize;
	
	// Move
	[self setPosition:ccp(self.position.x + velocity.x, self.position.y + velocity.y)];
	
	// Increment the distance moved by the velocity vector
	distanceMoved += sqrt(pow(velocity.x, 2) + pow(velocity.y, 2));
	
	// Determine if bullet is expired -- check to see if its gone at least half the width of the screen
	if (distanceMoved > windowSize.width / 2)
		expired = TRUE;
		
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
<p>Pretty easy, right? There shouldn't be anything in these two classes that should surprise you too much; perhaps just some of the wonky Objective-C syntax, which you will get used to over time. OK, so now that we've created all three of the objects our game is going to use, let's go back to the GameScene class and actually add the bullets and asteroids. We'll also create write convenience methods that we'll use for creating bullets and asteroids, as well as add some Objective-C arrays that will be used to keep track of all the bullets and asteroids that are on screen. Add the following variable declarations in "GameScene.h" between the brackets after <code>@interface GameLayer : CCLayer</code>.</p>
<pre class="brush:cpp">
	// Arrays used to keep track of all visible asteroids/bullets
	NSMutableArray *asteroids;
	NSMutableArray *bullets;

	// Used to determine the number of asteroids that appear 
	int currentLevel;
</pre>
<p>Then add the following method declarations after the <code>+ (id)scene;</code> declaration. You can see that these method names are very verbose... some people don't like that, but I think it makes reading Objective-C code very easy (as long as you name your methods well). We'll put code in these two methods that create bullets and asteroids. Since asteroids can be created anywhere on the screen and have multiple sizes, the "createAsteroid" method has two arguments, "position" and "size." Bullets can only be shot by the ship, the position of which is pre-determined, so "createBullet" doesn't need any arguments. To end it up, we'll create some additional methods which will be used to reset the game and start new levels.</p>
<pre class="brush:cpp">
- (void)createAsteroidAt:(CGPoint)position withSize:(int)size;
- (void)createBullet;
- (void)startLevel;
- (void)resetShip;
</pre>
<p>Now let's actually code these methods in "GameScene.m." As you can see, you'll have to create three asteroid graphics (small, medium, and large) as well as a bullet graphic and add them to your project. If you don't add the files to the project (for example, if you just put the files in the project directory structure), the game will crash when you call these methods.</p>
<pre class="brush:cpp">
- (void)createAsteroidAt:(CGPoint)position withSize:(int)size
{
	// Decide which image file to use for the new asteroid
	NSString *imageFile;
	switch (size) 
	{
		default:
		case kAsteroidLarge:
			imageFile = @"asteroid-large.png";
			break;
		case kAsteroidMedium:
			imageFile = @"asteroid-medium.png";
			break;
		case kAsteroidSmall:
			imageFile = @"asteroid-small.png";
			break;
	}
	
	// Create a new asteroid object using the appropriate image file
	Asteroid *a = [Asteroid spriteWithFile:imageFile];
	
	// Set the size and position
	a.size = size;
	a.position = position;
	
	// Random numbers - see http://stackoverflow.com/questions/160890/generating-random-numbers-in-objective-c
	a.velocity = ccp((float)(arc4random() % 100) / 100 - 1, (float)(arc4random() % 100) / 100 - 1);
	
	// Add asteroid to organizational array
	[asteroids addObject:a];
	
	// Add asteroid to layer
	[self addChild:a];
}

- (void)createBullet
{
	// Create a new asteroid object using the appropriate image file
	Bullet *b = [Bullet spriteWithFile:@"bullet.png"];
	
	// Set the bullet's position by starting w/ the ship's position, then adding the rotation vector, so the bullet appears to come from the ship's nose
	b.position = ccp(ship.position.x + cos(CC_DEGREES_TO_RADIANS(ship.rotation)) * ship.contentSize.width, ship.position.y - sin(CC_DEGREES_TO_RADIANS(ship.rotation)) * ship.contentSize.height);
	
	// Set the bullet's velocity to be in the same direction as the ship is pointing, plus whatever the ship's velocity is
	b.velocity = ccp(cos(CC_DEGREES_TO_RADIANS(ship.rotation)) * 2 + ship.velocity.x, -sin(CC_DEGREES_TO_RADIANS(ship.rotation)) * 2 + ship.velocity.y);
	
	// Add bullet to organizational array
	[bullets addObject:b];
	
	// Add bullet to layer
	[self addChild:b];
}

- (void)startLevel
{
	// Reset the ship's position, which also removes all bullets
	[self resetShip];

	// Get window size
	CGSize windowSize = [CCDirector sharedDirector].winSize;
	
	// Create asteroids based on level number
	for (int i = 0; i < (currentLevel + 2); i++)
	{
		// Random numbers - see http://stackoverflow.com/questions/160890/generating-random-numbers-in-objective-c
		CGPoint randomPointOnScreen = ccp((float)(arc4random() % 100) / 100 * windowSize.width, (float)(arc4random() % 100) / 100 * windowSize.height);

		[self createAsteroidAt:randomPointOnScreen withSize:kAsteroidLarge];
	}
}

- (void)resetShip
{
	// Reset ship position/speed
	CGSize windowSize = [CCDirector sharedDirector].winSize;
	ship.position = ccp(windowSize.width / 2, windowSize.height / 2);
	ship.velocity = ccp(0, 0);
	
	// Remove all existing bullets from layer
	for (Bullet *b in bullets)
		[self removeChild:b cleanup:NO];
	
	// Empty out bullet-storing array
	[bullets removeAllObjects];
}
</pre>
<p>That's a lot of code to break down, but the comments and descriptive method names should help in understanding what each block does. The first question you probably have would be, "what's up with <code>kAsteroidLarge</code>, <code>kAsteroidMedium</code>, and <code>kAsteroidSmall</code>?" Those are constants that we will define in a configuration file. They represent the integers 1, 2, and 3, but are more readable and make more sense than plain ol' numbers.  Open the "GameConfig.h" file that's in your project, and add the following definitions to the end of it:</p>
<pre class="brush:cpp">
#define kAsteroidLarge 1
#define kAsteroidMedium 2
#define kAsteroidSmall 3
</pre>
<p>Now make sure to import that config file into GameScene.m by adding <code>#import "GameConfig.h"</code> at the top, near the other <code>import</code> declarations. Also, make sure to import the header files for the asteroid and bullet classes as well. In total, your import list should look like this:</p>
<pre class="brush:cpp">
#import "GameScene.h"
#import "Ship.h"
#import "Asteroid.h"
#import "Bullet.h"
#import "GameConfig.h"
</pre>
<p>Whew! That's a lot of nonsense to plow through. Let's make two more small changes before we check our progress so far. The first is to add a bit more code into our "init" method:</p>
<pre class="brush:cpp">
// Initialize arrays that will be used to store other game objects
asteroids = [[NSMutableArray array] retain];
bullets = [[NSMutableArray array] retain];
		
// Call method which positions the ship and creates asteroids
[self startLevel];
</pre>
<p><strong>Warning:</strong> most cocos2d objects are auto-released from memory when they are no longer needed, but if you use other Objective-C data structures, you'll have to manually release them from memory. You can see that we initialize and "retain" the two arrays in memory, so we'll have to deallocate them when the GameScene object is deallocated. Create a "dealloc" method at the end of "GameScene.m" and put the following into it:</p>
<pre class="brush:cpp">
- (void)dealloc
{
	// Release all the pointers that have been retained in this class
	[asteroids release];
	[bullets release];

	[super dealloc];
}
</pre>
<p>The next is to make a call to the "createBullet" method in the appropriate place, so that the ship can shoot. In the "ccTouchesEnded" method, find this block of code, and add <code>[self createBullet];</code>:</p>
<pre class="brush:cpp">
// If the distance moved (in pixels) is small enough, consider the gesture a tap
if (distance < 5)
{
	// Shoot!
	[self createBullet];
}
// Otherwise, it's a swipe
else
{
	// Use distance of swipe as a multiplier for the ship velocity (longer swipe, go faster)
	ship.velocity = ccp(cos(CC_DEGREES_TO_RADIANS(ship.rotation)) * distance / 100, -sin(CC_DEGREES_TO_RADIANS(ship.rotation)) * distance / 100);
}
</pre>
<p>Save, build and run the project, and you should see some asteroids roaming around the screen. And you should be able to tap the screen to shoot in the direction your ship is facing. The last thing we need to do for this part of the tutorial is add collision detection between the asteroids, ship, and bullets. This is where those arrays that we created come in handy. We can iterate over the arrays and use them to check for collisions. To do that, we'll create an "update" method that will get called at each frame.</p>
<pre class="brush:cpp">
// Mostly handles collision detection
- (void)update:(ccTime)dt
{
	// If there are no more asteroids left, increment the level counter and start the new level
	if ([asteroids count] == 0)
	{
		currentLevel++;
		[self startLevel];
	}
	
	// Check for collisions vs. asteroids
	for (Asteroid *a in asteroids)
	{
		// Check if asteroid hits ship
		if ([a collidesWith:ship])
		{
			// Reset ship position
			[self resetShip];
			
			// Remove the asteroid the ship collided with
			[asteroids removeObject:a];
			
			// Remove asteroid sprite from layer
			[self removeChild:a cleanup:NO];
			
			// This asteroid is gone, so go to the next one - no need to check if a bullet has also hit it
			continue;
		}
		
		// Check if asteroid hits bullet, or if bullet is expired
		for (Bullet *b in bullets)
		{
			if (b.expired)
			{
				// Remove the bullet from organizational array
				[bullets removeObject:b];
				
				// Remove bullet sprite from layer
				[self removeChild:b cleanup:NO];
			}
			else if ([a collidesWith:b])
			{
				// Remove the asteroid the bullet collided with
				[asteroids removeObject:a];
				
				// Remove asteroid sprite from layer
				[self removeChild:a cleanup:NO];
				
				// Remove the bullet the asteroid collided with
				[bullets removeObject:b];
				
				// Remove bullet sprite from layer
				[self removeChild:b cleanup:NO];
				
				// Create two new asteroids in the place of the destroyed one, if the destroyed one wasn't already the smallest
				if (a.size < kAsteroidSmall) 
				{
					for (int i = 0; i < 2; i++)
						[self createAsteroidAt:a.position withSize:a.size + 1];
				}

			}	// End bullet/asteroid collision check
		}	// End bullet loop
	}	// End asteroid loop
}
</pre>
<p>The first thing "update" does is check to see if the asteroid array is empty; if it is, then the next level starts. If the asteroid array is not empty, it loops through each asteroid, checking to see if the asteroid hits the ship (reset ship and remove asteroid if so), or any of the bullets on screen (remove bullet and asteroid, then create two more asteroids if the asteroid size != small). The only thing we need to do now is tell the layer that we want the "update" method to be scheduled to run every frame. It's pretty simple... in the "init" method of the layer, just add <code>[self scheduleUpdate];</code> and you're good to go. </p>
<p>Build and run the project again, and all the objects should react to each other in the correct way. If not, perhaps you (or I) have made a mistake somewhere... let me know in the comments, and I'll try to help out. You can also download a <a href='http://ganbarugames.com/wp-content/uploads/2010/12/asteroids-after-part-2.zip'>.zip with all the project files</a> for reference.</p>
<p><strong>Edit:</strong> check out <a href="/2011/03/cocos2d-game-tutorial-multitouch-asteroids-part-3/">part three</a> of the tutorial series!</p>
