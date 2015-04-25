---
layout: post
status: publish
published: true
title: cocos2d Game Tutorial – Multitouch Asteroids (Part 3)
author:
  display_name: nathan
  login: nathan
  email: ndemick@gmail.com
  url: ''
author_login: nathan
author_email: ndemick@gmail.com
wordpress_id: 255
wordpress_url: http://ganbarugames.com/?p=255
date: '2011-03-09 14:17:01 -0500'
date_gmt: '2011-03-09 19:17:01 -0500'
categories:
- Programming
- Tutorial
tags:
- programming
- games
- cocos2d
- tutorial
- objective-c
- ui
comments:
- id: 24
  author: Sharris595
  author_email: sharris595@aol.com
  author_url: ''
  date: '2011-03-18 17:35:00 -0400'
  date_gmt: '2011-03-18 17:35:00 -0400'
  content: is the source available for download?  Thanks!
- id: 25
  author: Nathan
  author_email: ndemick@gmail.com
  author_url: http://ganbarugames.com
  date: '2011-03-18 17:45:00 -0400'
  date_gmt: '2011-03-18 17:45:00 -0400'
  content: Yep, there's a link at the very end of the post. Let me know if you have
    any problems with it!
- id: 27
  author: JunoMan
  author_email: chris@junofirst.com
  author_url: ''
  date: '2011-04-01 01:41:00 -0400'
  date_gmt: '2011-04-01 01:41:00 -0400'
  content: |
    Just tried compiling the source and XCode complains that design-doc.rtf is missing.

    I just removed it from the project and it ran fine.
- id: 28
  author: Nathan
  author_email: ndemick@gmail.com
  author_url: http://ganbarugames.com
  date: '2011-04-04 22:04:00 -0400'
  date_gmt: '2011-04-04 22:04:00 -0400'
  content: Hmm, must've accidentally left that stray file in there. I modified the
    project and deleted the reference. Thanks for pointing it out.
- id: 62
  author: dercy
  author_email: dercyvtf@gmail.com
  author_url: ''
  date: '2011-11-02 10:05:00 -0400'
  date_gmt: '2011-11-02 14:05:00 -0400'
  content: and if I wanted to display the name along with score, how would it?
- id: 63
  author: Nathan
  author_email: ndemick@gmail.com
  author_url: http://ganbarugames.com
  date: '2011-11-03 12:33:00 -0400'
  date_gmt: '2011-11-03 16:33:00 -0400'
  content: That would be a bit trickier. Instead of storing an array of NSNumbers
    in your NSUserDefaults, you'd have to store NSDictionary objects, where each dictionary
    contained an NSNumber and NSString (for the player's name/initials). Then, when
    the player's game was over, you would have to add an UITextField to the cocos2d
    OpenGL view and show a "save" button when the player had finished entering their
    name. Then you could get the value from the UITextField and store it as a string.
    I chose to store only scores in this example, because it's so much simpler. 
- id: 64
  author: dercy
  author_email: dercyvtf@gmail.com
  author_url: ''
  date: '2011-11-05 10:22:00 -0400'
  date_gmt: '2011-11-05 14:22:00 -0400'
  content: If you could help at least with the NSDictionary it would be great, I have
    been trying so many times and have succeeded. When I added a name for a new score
    it automatically changed all the other names for the same e.g. if I put George,
    on the all the other names would change for George. Thank you for your time.
- id: 65
  author: Nathan
  author_email: ndemick@gmail.com
  author_url: http://ganbarugames.com
  date: '2011-11-05 20:44:00 -0400'
  date_gmt: '2011-11-06 00:44:00 -0400'
  content: Sure, can you post an example of your code somewhere?
- id: 66
  author: dercy
  author_email: dercyvtf@gmail.com
  author_url: ''
  date: '2011-11-05 22:15:00 -0400'
  date_gmt: '2011-11-06 02:15:00 -0500'
  content: |
    http://paste2.org/p/1761151
- id: 67
  author: Nathan
  author_email: ndemick@gmail.com
  author_url: http://ganbarugames.com
  date: '2011-11-07 09:40:00 -0500'
  date_gmt: '2011-11-07 14:40:00 -0500'
  content: |-
    Only thing I can see is that maybe you're accidentally referencing the NSUserDefaults [defaults valueForKey:@"name"] instead of a new string obj. Try doing something like this instead: 
    NSString *name = [NSString stringWithString:[defaults valueForKey:@"name"]];
- id: 68
  author: dercy
  author_email: dercyvtf@gmail.com
  author_url: ''
  date: '2011-11-07 11:41:00 -0500'
  date_gmt: '2011-11-07 16:41:00 -0500'
  content: Honestly, I don't know what else to do, if something is missing, if the
    dictionary is right
- id: 77
  author: Ryan
  author_email: ryanhides@gmail.com
  author_url: ''
  date: '2011-12-21 18:44:00 -0500'
  date_gmt: '2011-12-21 23:44:00 -0500'
  content: "I was getting a crash when more than one bullet was being removed from
    the game\n\nthis code worked for me\n\nfor(int i = bullets.count - 1; i &gt;=
    0; i--)\n    {\n        if([[bullets objectAtIndex:i] expired]) {\n           
    [self removeChild:[bullets objectAtIndex:i] cleanup:YES];\n            [bullets
    removeObjectAtIndex:i];\n        }\n    }\n    \n    /*for (Bullet *b in bullets)\n   
    {\n        if (b.expired)\n        {\n\n            // Remove the bullet from
    organizational array\n\n            [bullets removeObject:b];\n\n            //
    Remove bullet sprite from layer\n            [self removeChild:b cleanup:NO];\n           
    \n        }\n    }*/"
- id: 78
  author: Nathan
  author_email: ndemick@gmail.com
  author_url: http://ganbarugames.com
  date: '2011-12-28 13:16:00 -0500'
  date_gmt: '2011-12-28 18:16:00 -0500'
  content: Thanks for pointing that out. I found out after I posted this that modifying
    an NSMutableArray that is being enumerated will produce a crash, but I didn't
    think it could happen in this simple example. Wrong, of course =] Using a for
    loop solves the problem.  I'll (hopefully) update the code sometime soon.
- id: 82
  author: Greg
  author_email: gregory.rendek@asu.edu
  author_url: ''
  date: '2012-01-25 22:13:00 -0500'
  date_gmt: '2012-01-26 03:13:00 -0500'
  content: |-
    Hello,

    I just wanted to say this is a great tutorial.  It was exactly what I was looking for, so thank you for taking the time to put this together.  The piece I am most interested in is storing high scores.  I got that to work great for my project.  I just have one question though, I am unable to store a score higher than 9999.  I am guessing this is due to some bit storage limit that I am not aware of.  How could I store, say, up to 9 million for a game score?
- id: 83
  author: Greg
  author_email: gregory.rendek@asu.edu
  author_url: ''
  date: '2012-01-25 23:31:00 -0500'
  date_gmt: '2012-01-26 04:31:00 -0500'
  content: |-
    Hey disregard the question, I was an error totally on my end, forgot to import one of my header files in one of my implementation files.  Got it working great.  Thanks again for the tutorial!

    Greg
- id: 90
  author: JJ
  author_email: asdf@gasdlkfljkasdf.com
  author_url: ''
  date: '2012-03-15 21:08:00 -0400'
  date_gmt: '2012-03-16 01:08:00 -0400'
  content: ' Can you post the updated source code.... I can''t get it to work.  '
- id: 92
  author: Nathan
  author_email: ndemick@gmail.com
  author_url: http://ganbarugames.com
  date: '2012-03-16 11:22:00 -0400'
  date_gmt: '2012-03-16 15:22:00 -0400'
  content: Yeah, I'll try to get that up this weekend.
- id: 97
  author: IceTr3
  author_email: icetr3@yahoo.com
  author_url: ''
  date: '2012-04-21 15:12:00 -0400'
  date_gmt: '2012-04-21 19:12:00 -0400'
  content: I tried but for some reason my ship isn't rotating.
- id: 98
  author: Nathan
  author_email: ndemick@gmail.com
  author_url: http://ganbarugames.com
  date: '2012-04-23 09:20:00 -0400'
  date_gmt: '2012-04-23 13:20:00 -0400'
  content: Is the layer receiving touch events? Make sure you have self.isTouchEnabled
    = YES; in your init method. You also have to specify that the app supports multitouch
    by putting the command glView.multipleTouchEnabled = YES; in your app delegate
    after the OpenGL view gets instantiated.
- id: 126
  author: Yankee
  author_email: uwe@thaden.de
  author_url: ''
  date: '2014-02-02 10:57:00 -0500'
  date_gmt: '2014-02-02 15:57:00 -0500'
  content: Hi, what do I have to change to compile and run the zipped-source using
    Xcode5?
- id: 127
  author: ddcc
  author_email: acxsx@gmail.com
  author_url: ''
  date: '2014-02-05 06:29:00 -0500'
  date_gmt: '2014-02-05 11:29:00 -0500'
  content: hi
- id: 128
  author: Nathan
  author_email: ndemick@gmail.com
  author_url: http://ganbarugames.com
  date: '2014-02-05 16:47:00 -0500'
  date_gmt: '2014-02-05 21:47:00 -0500'
  content: Good question, the version of cocos2d in the source is super old by now,
    but I imagine that most of the code should still be more or less idiomatic. You
    should be able to download the newest version of the framework, create a new Xcode
    5 project with it, then copy over the game files. Unfortunately I've moved on
    from cocos2d, so I'm afraid I can't be much help at this point.
---
<p>Hey, welcome back to yet another installment of the "multitouch asteroids" tutorial series. If you haven't been following along, you can always go back and review <a href="/2010/12/cocos2d-game-tutorial-multitouch-asteroids-part-one/" title="multitouch asteroids tutorial part one">part one</a> or <a href="/2011/01/cocos2d-game-tutorial-multitouch-asteroids-part-2/" title="multitouch asteroids tutorial part two">part two</a>. This tutorial will focus on fleshing out the asteroids-style game that we created, including making both a title scene and "how to play" scene, as well as storing player high scores. </p>
<p>As it stands right now, starting our app takes the player directly into the action without any warning. In addition, there's no explanation of the controls, which would definitely be confusing for the first-time player. An easy way to fix this problem would be to create an introductory title screen, that shows off the name of the game and has buttons that start the game, view instructions, or view the high scores. </p>
<p>We're going to be a bit forward thinking and create three new layer classes all at the same time, then go back and fill in the implementation details later. Open up your project in Xcode, right-click the Classes group, then select Add > New File. Make the new file a subclass of CCLayer, and name it "TitleScene.m". Now go ahead and do the same thing two more times, naming each new source file "SourceScene.m" and "ControlsScene.m", respectively. In each of the three new header files, add a <code>+ (id)scene</code> class method declaration, between the <code>@interface</code> and <code>@end</code> statements so the code looks like this:</p>
<pre class="brush:cpp">
// TitleScene.h
@interface TitleLayer : CCLayer { }
+ (id)scene;
@end

// ControlsScene.h
@interface ControlsLayer : CCLayer { }
+ (id)scene;
@end

// ScoresScene.h
@interface ScoresLayer : CCLayer { }
+ (id)scene;
@end
</pre>
<p>Next, go into each of the new .m files, and add the following code between <code>@implementation</code> and <code>@end</code>, which will create a generic CCScene, then add your layer to it.</p>
<pre class="brush:cpp">
+ (id)scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	// Be sure to specify the "ScoresLayer" class in "ScoresScene.m", etc.
	ControlsLayer *layer = [ControlsLayer node];
	
	// add layer as a child to scene
	[scene addChild:layer];
	
	// return the scene
	return scene;
}

- (id)init
{
	if ((self = [super init]))
	{
		// Code goez here
	}
	return self;
}
</pre>
<p>These will be your basic steps every time you want to add a new scene/layer to a cocos2d project. Now, let's focus on the title scene. We'll probably want to have a large bit of text that displays the name of the game, as well as the buttons necessary to navigate through the different scenes we create. This is the pattern that we'll follow for the high scores scene as well as the game controls scene. Add the following in the <code>init</code> method of the title scene class, after the "code goez here" comment.</p>
<pre class="brush:cpp">
// Get window size
CGSize windowSize = [CCDirector sharedDirector].winSize;
		
// Create text label for title of game - "@stroids" - don't sue me Atari!
CCLabelTTF *title = [CCLabelTTF labelWithString:@"@stroids" fontName:@"Courier" fontSize:64.0];
		
// Position title at center of screen
[title setPosition:ccp(windowSize.width / 2, windowSize.height / 2)];
		
// Add to layer
[self addChild:title z:1];
</pre>
<p>This just puts a big TrueType text label smack in the center of the screen with the title of the game. Next we'll want to create three buttons that link to the different areas of the game &mdash; the "how to play" scene, the high scores scene, and the actual game itself.</p>
<pre class="brush:cpp">
// Set the default CCMenuItemFont font
[CCMenuItemFont setFontName:@"Courier"];
		
// Create "play," "scores," and "controls" buttons - when tapped, they call methods we define: playButtonAction and scoresButtonAction
CCMenuItemFont *playButton = [CCMenuItemFont itemFromString:@"play" target:self selector:@selector(playButtonAction)];
CCMenuItemFont *scoresButton = [CCMenuItemFont itemFromString:@"scores" target:self selector:@selector(scoresButtonAction)];
CCMenuItemFont *controlsButton = [CCMenuItemFont itemFromString:@"controls" target:self selector:@selector(controlsButtonAction)];
		
// Create menu that contains our buttons
CCMenu *menu = [CCMenu menuWithItems:playButton, scoresButton, controlsButton, nil];
		
// Align buttons horizontally
[menu alignItemsHorizontallyWithPadding:20.0];
		
// Set position of menu to be below the title text
[menu setPosition:ccp(windowSize.width / 2, title.position.y - title.contentSize.height / 1.5)];
		
// Add menu to layer
[self addChild:menu z:2];
</pre>
<p>I'm being lazy here and just creating text-based buttons. An exercise for the reader might be to create some nifty-looking graphical buttons to use instead. You can see the first method I call is to set the font that will be used for subsequent <code>CCMenuItemFont</code> buttons. Next, the three buttons are instantiated, added to a menu, aligned horizontally, then added to the layer. You can see that each of these buttons calls a different method when it is tapped, so let's create those methods now. After the <code>init</code> method in TitleScene.m, add the following:</p>
<pre class="brush:cpp">
- (void)playButtonAction
{
	NSLog(@"Switch to GameScene");
	[[CCDirector sharedDirector] replaceScene:[GameLayer scene]];
}

- (void)scoresButtonAction
{
	NSLog(@"Switch to ScoresScene");
	[[CCDirector sharedDirector] replaceScene:[ScoresLayer scene]];
}

- (void)controlsButtonAction
{
	NSLog(@"Switch to ControlsScene");
	[[CCDirector sharedDirector] replaceScene:[ControlsLayer scene]];
}
</pre>
<p>These are simple methods that just switch the active scene class running in the app. Make sure to <code>#import</code> the GameLayer.h, ScoresLayer.h and ControlsLayer.h headers at the top of the file, otherwise you'll get errors because you tried to create an object the current scene knows nothing about.</p>
<p>The last thing we're going to do in the TitleScene class is initialize the high scores data structure, which will be stored using NSUserDefaults. This is kind of a hacky way to store scores, but it's easy and it works, so why not?</p>
<pre class="brush:cpp">
// Place the following at the end of the init method in TitleScene.m

// Get user defaults
NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
		
// Register default high scores - this could be more easily done by loading a .plist instead of manually creating this nested object
NSDictionary *defaultDefaults = [NSDictionary dictionaryWithObject:[NSArray arrayWithObjects:[NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], nil] forKey:@"scores"];

[defaults registerDefaults:defaultDefaults];
[defaults synchronize];
</pre>
<p>The NSUserDefaults object is like an NSDictionary, in which you can store various values associated with a "key." Here, I'm storing an NSArray (filled with zeros) associated with the key "scores." The thing to remember here is that this zero'd out array is only used the first time the app is launched, or if the NSUserDefaults are otherwise erased. As you may be able to tell by now, we're going to store the top five high scores. Of course, the first time the game is played, the top scores will all be zero.</p>
<p>Next, let's delve into the ControlsScene class. Not too much new here... we'll just create a few labels that explain how to play the game, along with a button that takes the player back to the title screen.</p>
<pre class="brush:cpp">
// Goes in the init method of ControlsScene.m
		
// Get window size
CGSize windowSize = [CCDirector sharedDirector].winSize;
		
// Create title label
CCLabelTTF *title = [CCLabelTTF labelWithString:@"how to play" fontName:@"Courier" fontSize:32.0];
[title setPosition:ccp(windowSize.width / 2, windowSize.height - title.contentSize.height)];
[self addChild:title];
		
// Brief description ov how to control the game:
// Tap = Shoot
// Pinch = Rotate
// Swipe = Move

// Create label that will display the controls - manually set the dimensions due to multi-line content
CCLabelTTF *controlsLabel = [CCLabelTTF labelWithString:@"tap = shoot\npinch = rotate\nswipe = move" dimensions:CGSizeMake(windowSize.width, windowSize.height / 3) alignment:CCTextAlignmentCenter fontName:@"Courier" fontSize:16.0];
[controlsLabel setPosition:ccp(windowSize.width / 2, windowSize.height / 2)];
[self addChild:controlsLabel];
		
// Create button that will take us back to the title screen
CCMenuItemFont *backButton = [CCMenuItemFont itemFromString:@"back" target:self selector:@selector(backButtonAction)];
		
// Create menu that contains our buttons
CCMenu *menu = [CCMenu menuWithItems:backButton, nil];
		
// Set position of menu to be below the scores
[menu setPosition:ccp(windowSize.width / 2, controlsLabel.position.y - controlsLabel.contentSize.height)];
		
// Add menu to layer
[self addChild:menu z:2];
</pre>
<p>Also, make sure to create the <code>backButtonAction</code> method which will return the player back to the title screen. This method will go after <code>init</code> but before the <code>@end</code> of the class implementation.</p>
<pre class="brush:cpp">
- (void)backButtonAction
{
	NSLog(@"Switch to TitleScene");
	[[CCDirector sharedDirector] replaceScene:[TitleLayer scene]];
}
</pre>
<p>The ScoresScene class will be almost exactly the same as ControlsScene, with the notable exception of displaying the stored high scores instead of a static string of instructions.</p>
<pre class="brush:cpp">
// Put the following in the init method of ScoresLayer

// Get window size
CGSize windowSize = [CCDirector sharedDirector].winSize;
		
// Get scores array stored in user defaults
NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
		
// Get high scores array from "defaults" object
NSArray *highScores = [defaults arrayForKey:@"scores"];
		
// Create title label
CCLabelTTF *title = [CCLabelTTF labelWithString:@"high scores" fontName:@"Courier" fontSize:32.0];
[title setPosition:ccp(windowSize.width / 2, windowSize.height - title.contentSize.height)];
[self addChild:title];
		
// Create a mutable string which will be used to store the score list
NSMutableString *scoresString = [NSMutableString stringWithString:@""];
		
// Iterate through array and print out high scores
for (int i = 0; i < [highScores count]; i++)
{
	[scoresString appendFormat:@"%i. %i\n", i + 1, [[highScores objectAtIndex:i] intValue]];
}
		
// Create label that will display the scores - manually set the dimensions due to multi-line content
CCLabelTTF *scoresLabel = [CCLabelTTF labelWithString:scoresString dimensions:CGSizeMake(windowSize.width, windowSize.height / 3) alignment:CCTextAlignmentCenter fontName:@"Courier" fontSize:16.0];
[scoresLabel setPosition:ccp(windowSize.width / 2, windowSize.height / 2)];
[self addChild:scoresLabel];
		
// Create button that will take us back to the title screen
CCMenuItemFont *backButton = [CCMenuItemFont itemFromString:@"back" target:self selector:@selector(backButtonAction)];
		
// Create menu that contains our buttons
CCMenu *menu = [CCMenu menuWithItems:backButton, nil];
		
// Set position of menu to be below the scores
[menu setPosition:ccp(windowSize.width / 2, scoresLabel.position.y - scoresLabel.contentSize.height)];
		
// Add menu to layer
[self addChild:menu z:2];
</pre>
<p>The real wonky line in this code is <code>[scoresString appendFormat:@"%i. %i\n", i + 1, [[highScores objectAtIndex:i] intValue]];</code>. This appends additional text to the end of the mutable string that is used to display the high scores. <code>highScores</code> is the NSArray stored in the NSUserDefaults that stores the scores. An NSArray can only hold objects derived from NSObject, so that's why we wrap each number with NSNumber before putting it in the array. To get a regular integer from an NSNumber, you use the <code>intValue</code> method; e.g. <code>int myNumber = [myNSNumber intValue];</code>. Finally, don't forget to add the <code>backButtonAction</code> method to the ScoresLayer class after the <code>init</code> method.</p>
<pre class="brush:cpp">
- (void)backButtonAction
{
	NSLog(@"Switch to TitleScene");
	[[CCDirector sharedDirector] replaceScene:[TitleLayer scene]];
}
</pre>
<p>OK, so we're getting close to finishing the improvements that make this project seem more like "finished" game. When we left off programming the actual game class, the player could play indefinitely. We'll make a modification to the GameScene class so that a "game over" message is displayed when the player's ship is destroyed, and their score will be saved if its' high enough. Open up GameScene.h and add <code>- (void)gameOver;</code> at the bottom of the class method declaration list. Then open GameScene.m and add the implementation:</p>
<pre class="brush:cpp">
- (void)gameOver
{
	// Reset the ship's position, which also removes all bullets
	[self resetShip];
	
	// Hide ship
	ship.visible = NO;
	
	// Get window size
	CGSize windowSize = [CCDirector sharedDirector].winSize;
	
	// Show "game over" text
	CCLabelTTF *title = [CCLabelTTF labelWithString:@"game over" fontName:@"Courier" fontSize:64.0];
	
	// Position title at center of screen
	[title setPosition:ccp(windowSize.width / 2, windowSize.height / 2)];
	
	// Add to layer
	[self addChild:title z:1];
	
	// Create button that will take us back to the title screen
	CCMenuItemFont *backButton = [CCMenuItemFont itemFromString:@"back to title" target:self selector:@selector(backButtonAction)];
	
	// Create menu that contains our button
	CCMenu *menu = [CCMenu menuWithItems:backButton, nil];
	
	// Set position of menu to be below the "game over" text
	[menu setPosition:ccp(windowSize.width / 2, title.position.y - title.contentSize.height)];
	
	// Add menu to layer
	[self addChild:menu z:2];
	
	// Get scores array stored in user defaults
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	
	// Get high scores array from "defaults" object
	NSMutableArray *highScores = [NSMutableArray arrayWithArray:[defaults arrayForKey:@"scores"]];
	
	// Iterate thru high scores; see if current point value is higher than any of the stored values
	for (int i = 0; i < [highScores count]; i++)
	{
		if (points >= [[highScores objectAtIndex:i] intValue])
		{
			// Insert new high score, which pushes all others down
			[highScores insertObject:[NSNumber numberWithInt:points] atIndex:i];
			
			// Remove last score, so as to ensure only 5 entries in the high score array
			[highScores removeLastObject];
			
			// Re-save scores array to user defaults
			[defaults setObject:highScores forKey:@"scores"];
			
			[defaults synchronize];
			
			NSLog(@"Saved new high score of %i", points);
			
			// Bust out of the loop 
			break;
		}
	}
}
</pre>
<p>This method will get called when an asteroid runs into the ship, so in the <code>update</code> method in the big loop that cycles through all the asteroid objects, the first if conditional will be changed to look like this:</p>
<pre class="brush:cpp">
// Check for collisions vs. asteroids
for (int i = 0; i < [asteroids count]; i++)
{
	Asteroid *a = [asteroids objectAtIndex:i];
        
	// Check if asteroid hits ship
	if ([a collidesWith:ship])
	{
		// Game over, man!
		[self gameOver];
	}
// ... rest of loop here
}
</pre>
<p>The last thing you'll have to do is change the AppDelegate so that the app gets launched with the TitleScene class instead of the GameScene class. Add <code>#import "TitleScene.h"</code> to the top of the AppDelegate file, and then change the last line in the <code>applicationDidFinishLaunching</code> method.</p>
<pre class="brush:cpp">
- (void) applicationDidFinishLaunching:(UIApplication*)application
{
	// ... other cocos2d init stuff here

	[[CCDirector sharedDirector] runWithScene: [TitleLayer scene]];
}
</pre>
<p>Try building and running the app to see these changes in effect. The game could still be polished further, but it's looking a heck of a lot better than where we left it at the end of the previous tutorial. At this point you could theoretically put it out on the App Store (albeit for free, since it's pretty bare bones). Feel free to experiment with the code that you have... add your own graphics, or maybe an alien ship or powerups. You can <a href='http://ganbarugames.com/wp-content/uploads/2011/03/asteroids-tutorial-part-3.zip'>download the Xcode project</a> for reference. And make sure to tune in to the final part of the tutorial, where we'll add some particle systems and sound effects to make the game even more interesting.</p>
