---
layout: post
status: publish
published: true
title: Understanding “scenes” in cocos2d-iphone
author:
  display_name: nathan
  login: nathan
  email: ndemick@gmail.com
  url: ''
author_login: nathan
author_email: ndemick@gmail.com
wordpress_id: 44
wordpress_url: http://ganbarugames.com/?p=44
date: '2010-12-06 08:00:44 -0500'
date_gmt: '2010-12-06 13:00:44 -0500'
categories:
- Programming
- Tutorial
tags:
- iOS
- cocos2d
- CCScene
- CCLayer
- tutorial
comments:
- id: 5
  author: Detecting touch events in cocos2d-iphone | Ganbaru Games
  author_email: ''
  author_url: http://ganbarugames.com/2010/12/detecting-touch-events-in-cocos2d-iphone/
  date: '2010-12-13 08:31:13 -0500'
  date_gmt: '2010-12-13 13:31:13 -0500'
  content: '[...] the previous tutorial I wrote about scenes and layers, the basic
    structural classes of a cocos2d app. In this next [...]'
- id: 12
  author: Menus and buttons in cocos2d | Ganbaru Games
  author_email: ''
  author_url: http://ganbarugames.com/2011/01/menus-buttons-cocos2d/
  date: '2011-01-17 16:46:49 -0500'
  date_gmt: '2011-01-17 21:46:49 -0500'
  content: '[...] another look at the &#8220;scenes&#8221; tutorial. Now say that
    we have two scenes and want to flip back &#8216;n forth between them, and we&#8217;d
    [...]'
- id: 35
  author: Gaurav_Soni12345
  author_email: gaurav_soni12345@hotmail.com
  author_url: ''
  date: '2011-07-01 13:43:00 -0400'
  date_gmt: '2011-07-01 13:43:00 -0400'
  content: Thanks... very helpful can u tell the difference between +(id)init {} and
    -(id)init {}
- id: 36
  author: Nathan
  author_email: ndemick@gmail.com
  author_url: http://ganbarugames.com
  date: '2011-07-05 13:34:00 -0400'
  date_gmt: '2011-07-05 13:34:00 -0400'
  content: Yeah, any method marked with a "+" is a "class method", while "-" signifies
    an "instance method". Check out this explanation on Stack Overflow: http://stackoverflow.com/questions/1053592/objective-c-class-vs-instance-methods/1053646#1053646
- id: 120
  author: Ben
  author_email: benhc@live.co.uk
  author_url: ''
  date: '2013-05-12 03:12:00 -0400'
  date_gmt: '2013-05-12 07:12:00 -0400'
  content: Hi, Nice tutorial, but could you update it? :)
- id: 123
  author: Chinab
  author_email: chinab2@gmail.com
  author_url: ''
  date: '2013-06-29 07:12:00 -0400'
  date_gmt: '2013-06-29 11:12:00 -0400'
  content: Nice Tutorial Thanks a LOT :)
---
<p>One of the building blocks of a cocos2d app is the "scene" object. In any game, you'll have multiple scenes that help break apart your code into manageable chunks. Each scene contains discrete bits of game logic; for example, your project could consist of a title scene, game options scene, and gameplay scene. Each scene, in turn, contains one or more "layers." A layer is where you will actually do most of your programming to make stuff happen. For example, your "GameplayScene" might have two layers: an "ActionLayer" and a "HUDLayer." Both layers can be (obviously) stacked on top of each other, so that the HUD always appears over the gameplay. The default cocos2d template project creates a file called HelloWorldScene.m that automatically creates a scene and then adds a layer to it. You can basically copy this method if you find that you only need one layer for each scene (to be honest, for most games, you'll probably only need one layer per scene).</p>
<p>To navigate through your game's UI, you'll make calls to the cocos2d Director singleton to replace the currently active scene; something like <code>[[CCDirector sharedDirector] replaceScene:[MyAwesomeScene node]];</code> Most likely this call would be in a method that is run in response to a button being tapped, or after a level is completed so the player can return to a level select screen. You can also switch your scenes using some nifty transition effects that are built in to cocos2d. These are called like so: <code>[[CCDirector sharedDirector] replaceScene:[CCFlipXTransition transitionWithDuration:0.75 scene:[MyAwesomeScene node]]];</code> You can see a list of transitions by looking at the "CCTransition.h" file in the "cocos2d Sources/cocos2d" folder in your Xcode project.</p>
<p>As an example, I'll extend the default cocos2d template with an additional scene that I created, and then tie everything together with buttons that transition from one scene to the other. First off, create a new Xcode project and have it use the cocos2d template. I called my project "SceneExample." Build and run this project and you'll see the normal Hello World! text appear. So far, so good. Now let's add a new scene to the project. In the Groups & Files gutter, right-click on the Classes group, and select the Add > New File... option. In the window that pops up, choose to have your new class extend the CCNode class (under User Templates), and name the new file "MyAwesomeScene.m" (or whatever you want, really). Click Finish to add the new class files to your project.</p>
<p>Next, select the MyAwesomeScene.h header file, and make a few changes: </p>
<pre class="brush:cpp">
#import "cocos2d.h"

@interface MyAwesomeScene : CCScene {}
@end

// Extending CCColorLayer so that we can specify a 
// default background color other than black 
@interface MyAwesomeLayer : CCColorLayer {}
@end
</pre>
<p>The template we used automatically made MyAwesomeScene extend CCNode, but we actually want it to extend CCScene. In addition, I'm defining the new layer that I want to add to my scene here. This is basically just for convenience... if you want, you could put this code in MyAwesomeLayer.h/MyAwesomeLayer.m instead. Normally, I would have my layer class extend CCLayer, then add a .png as a background for whatever I wanted displayed. However, for this example I was lazy and just wanted to have a solid colored background on the new scene, so it'd be easy to see the neat-o transition effects. So I'm having the layer extend CCColorLayer. It's the exact same as a CCLayer, but when you initialize it, you can specify a RGBA value for the background. Awesome, right? Next, open up the MyAwesomeScene.m file. Here we'll define the implementation for the scene and layer that we put in the header:</p>
<pre class="brush:cpp">
#import "MyAwesomeScene.h"
#import "HelloWorldScene.h"

@implementation MyAwesomeScene

- (id)init
{
	if ((self = [super init]))
	{
		// All this scene does upon initialization is init & add the layer class
		MyAwesomeLayer *layer = [MyAwesomeLayer node];
		[self addChild:layer];
	}
	
	return self;
}

- (void)dealloc
{
	// Nothing else to deallocate
	[super dealloc];
}

@end
</pre>
<p>This is the code for the scene. It's about as bare bones as it gets. In the "init" method, which gets called when the class is created, we simply declare and create a new layer, then add it to the scene. Layers are set to auto-release their memory when no longer in use, so we don't have to do anything extra in the "dealloc" method. The "node" method that is called to create the layer is a static method that each cocos2d class inherits from CCNode, the base cocos class. It creates the object, runs your "init" method and handles memory management for you. Now on to the more interesting stuff.</p>
<pre class="brush:cpp">
@implementation MyAwesomeLayer

- (id)init
{
	// Since we extended CCColorLayer instead of regular ol' CCLayer,
	// we'll init the object with initWithColor. ccc4 takes rgba arguments - in 
	// this case it's a bright green background
	if ((self = [super initWithColor:ccc4(0, 255, 0, 255)]))
	{
		// Get window size
		CGSize size = [[CCDirector sharedDirector] winSize];
		
		// Add a button which takes us back to HelloWorldScene
		
		// Create a label with the text we want on the button
		CCLabelTTF *label = [CCLabelTTF labelWithString:@"Tap Here" fontName:@"Helvetica" fontSize:32.0];
		
		// Create a button out of the label, and tell it to run the "switchScene" method
		CCMenuItem *button = [CCMenuItemLabel itemWithLabel:label target:self selector:@selector(switchScene)];
		
		// Add the button to a menu - "nil" terminates the list of items to add
		CCMenu *menu = [CCMenu menuWithItems:button, nil];
		
		// Place the menu in center of screen
		[menu setPosition:ccp(size.width / 2, size.height / 2)];
		
		// Finally add the menu to the layer
		[self addChild:menu];
	}
	
	return self;
}

- (void)switchScene
{
	// Create a scene transition that uses the "RotoZoom" effect
	CCTransitionRotoZoom *transition = [CCTransitionRotoZoom transitionWithDuration:1.0 scene:[HelloWorld scene]];
	
	// Tell the director to run the transition
	[[CCDirector sharedDirector] replaceScene:transition];
}

- (void)dealloc
{
	// Nothing else to deallocate
	[super dealloc];
}

@end
</pre>
<p>This is the implementation for the layer, which is in the same MyAwesomeClass.m source file. You can see that we have all our code to actually display stuff on screen here. Don't worry too much about the code that creates a menu and button; one good thing about Objective-C is that method calls are so verbose that you can pretty easily figure out what is going on. The only thing I'll mention now is that you can't directly display a button in cocos2d; you have to add the button to a menu, then display the menu. The real point of interest here is the switchScene method, which creates a transition object and then tells the CCDirector singleton to run it. You can see that when I create my transition object, I specify a time duration for the transition to run over (one second) and the scene that I want to transition to (the default scene already in the project). There are a number of transition types... I'll leave it as a reader exercise to try out all the different effects.</p>
<p>OK, so the new class is created, which displays a button that transitions back to the first scene in the app. However, we'll have to modify that first scene a bit so we can transition to the new scene. In HelloWorldScene.m, make the following additions/changes:</p>
<pre class="brush:cpp">
// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init] )) {
		
		// create and initialize a Label
		CCLabelTTF *label = [CCLabelTTF labelWithString:@"Hello World" fontName:@"Marker Felt" fontSize:64];

		// ask director the the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
	
		// position the label on the center of the screen
		//label.position =  ccp( size.width /2 , size.height/2 );
		
		// add the label as a child to this Layer
		//[self addChild: label];
		
		CCMenuItemLabel *button = [CCMenuItemLabel itemWithLabel:label target:self selector:@selector(switchScene)];
		
		CCMenu *menu = [CCMenu menuWithItems:button, nil];
		
		[menu setPosition:ccp(size.width / 2, size.height / 2)];
		
		[self addChild:menu];
	}	
	return self;
}

- (void)switchScene
{
	// Set up a "FlipY" transition that moves to MyAwesomeScene
	CCTransitionFlipY *transition = [CCTransitionFlipY transitionWithDuration:1.0 scene:[MyAwesomeScene node]];
	
	// Tell the director to replace the currently running scene
	[[CCDirector sharedDirector] replaceScene:transition];
}
</pre>
<p>What we're doing here is slightly modifying the existing code. Instead of adding the label directly to the layer, we're shoving the label inside a button, shoving the button inside a menu, then adding the menu to the layer. The button is set up to call the switchScene method, which transitions to the new scene we created.</p>
<p>And with that, we're done! Build and run the project, then click on the "Hello World" text that pops up. You'll see a transition to the new scene. Click the "Tap Here" text to go back to the original scene. It's a basic example, but you can see how the code here could be expanded in a larger project. Download a <a href='http://ganbarugames.com/wp-content/uploads/2010/11/SceneExample.zip'>.zip with the project files</a>, iff'n you'd like. If there are any points that are unclear, don't hesitate to let me know in the comments.</p>
