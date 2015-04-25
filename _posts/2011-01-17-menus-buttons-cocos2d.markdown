---
layout: post
status: publish
published: true
title: Menus and buttons in cocos2d
author:
  display_name: nathan
  login: nathan
  email: ndemick@gmail.com
  url: ''
author_login: nathan
author_email: ndemick@gmail.com
wordpress_id: 47
wordpress_url: http://ganbarugames.com/?p=47
date: '2011-01-17 08:00:31 -0500'
date_gmt: '2011-01-17 13:00:31 -0500'
categories:
- Programming
- Tutorial
tags:
- programming
- iOS
- cocos2d
- iphone
- ipad
- tutorial
- ccmenu
- ccmenuitem
comments:
- id: 55
  author: Scott Rapson
  author_email: scottapotamas@googlemail.com
  author_url: ''
  date: '2011-10-13 06:24:00 -0400'
  date_gmt: '2011-10-13 10:24:00 -0400'
  content: |-
    Great. Didn't know about the blocking in cocos2d buttons. 

    You wouldn't know how to make the button trigger as soon as its touched do you?
- id: 56
  author: Nathan
  author_email: ndemick@gmail.com
  author_url: http://ganbarugames.com
  date: '2011-10-13 09:46:00 -0400'
  date_gmt: '2011-10-13 13:46:00 -0400'
  content: Hey Scott, the only way I know of is to make a subclass of CCMenu and edit
    the "-(BOOL) ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event" method
    so that the button is activated when the touch begins, as opposed to when the
    touch ends. Alternately, if you want that behavior in your whole game, you could
    just edit the CCMenu.m file directly.
- id: 57
  author: Scott Rapson
  author_email: scottapotamas@googlemail.com
  author_url: ''
  date: '2011-10-15 03:59:00 -0400'
  date_gmt: '2011-10-15 07:59:00 -0400'
  content: Thats kinda what I was thinking might eventuate. Thanks for the subclassing
    idea!
- id: 109
  author: Freelime Games
  author_email: wheeter@juno.com
  author_url: http://www.FreelimeGames.com/
  date: '2012-08-05 16:42:00 -0400'
  date_gmt: '2012-08-05 20:42:00 -0400'
  content: |-
    This line of the code...:
    [myMenu setPosition:cpp(160,240)]; 
    ...should be changed, from "cpp" to "ccp".
- id: 118
  author: dev iphone | Annotary
  author_email: ''
  author_url: https://annotary.com/collections/9392/dev-iphone
  date: '2013-04-08 18:12:26 -0400'
  date_gmt: '2013-04-08 22:12:26 -0400'
  content: '[...] Publisher   More from Clement Chenebault:    dev    fonts    CSS3    tutos         Sort
    Share   ganbarugames.com &nbsp; &nbsp; &nbsp; 4 minutes [...]'
---
<p>What the what? It's tutorial time again! This time the subject will be a bit smaller in scope than some of my previous entries: menus and buttons. Buttons are obviously a key ingredient in any game's UI. While iOS games might not use buttons for actual gameplay, at the very least your game will have a title screen with a "start playing" button on it. So I'm going to give a brief rundown of cocos2d's buttons, and their containers (appropriately enough, called "menus"). </p>
<p>Take another look at the <a href="http://ganbarugames.com/2010/12/understanding-scenes-in-cocos2d-iphone/">"scenes" tutorial</a>. Now say that we have two scenes and want to flip back 'n forth between them, and we'd like to use a button to do it. Well, unfortunately in cocos2d you can't just plop a button down in your scene; first you have to add a menu to the scene, then add "menu items" (read: buttons) to the menu. The advantages of using a menu are apparent when you have lots of buttons you need to wrangle, but it's annoying to have to use one for just one button.</p>
<p>You can create a menu just like you would any other cocos2d object. The constructor takes a comma-separated list of menu items that you want to store in your menu, so you'll have to make sure to create your buttons <em>before</em> the menu. Also, you'll need to make sure you end the list of buttons you send to the constructor with <code>nil</code>. Once you create and populate the menu, you can specify the layout of the buttons. Layout options include a horizontal or vertical layout (with or without padding), as well as alignment in columns and rows. Here's an example:</p>
<pre class="brush:cpp">
// Pretend that buttonOne and buttonTwo are already created
CCMenu *myMenu = [CCMenu menuWithItems:buttonOne, buttonTwo, nil];
[myMenu setPosition:cpp(160,240)];
[self addChild:myMenu z:1];

[myMenu alignItemsVertically];
[myMenu alignItemsVerticallyWithPadding:10];	// 10px of padding around each button
[myMenu alignItemsHorizontally];
[myMenu alignItemsHorizontallyWithPadding:20];	// 20px of padding around each button
[myMenu alignItemsInColumns:3];					// 3 columns
[myMenu alignItemsInRows:3];					// 3 rows
</pre>
<p>So you now know all about menus. How about their contents (aka menu items)? While there are a number of different options for creating buttons in cocos2d, we're going to focus on the two most useful ones, <code>CCMenuItemFont</code> and <code>CCMenuItemImage</code>, which allow you to easily create text- or image-based buttons. I'll also demonstrate <code>CCMenuItemToggle</code>, which is a button container that stores multiple buttons, but only one is shown (or "active") at a time. <code>CCMenuItemToggle</code> is perfect for a settings menu where you want to have on/off switches for different options.</p>
<p><code>CCMenuItemFont</code> is the class you'll use when you want a text-only button. This is often most useful for rapid prototyping, since in a "real" game, you'll want to make sure your button looks like it'll do something if tapped. However, if you want to just get something in place that actually works, then go back and create a button graphic later, this class is quite useful.</p>
<pre class="brush:cpp">
// Create a button (aka "menu item"), have it execute the "buttonOneAction" method when tapped
CCMenuItemFont *buttonOne = [CCMenuItemFont itemFromString:@"Tap Here!" target:self selector:@selector(buttonOneAction:)];

// Specify font details
[CCMenuItemFont setFontSize:32];
[CCMenuItemFont setFontName:@"Helvetica"];
</pre>
<p>When you create any button, you will probably want something to happen when a player taps the button. The second two arguments to the <code>CCMenuItemFont</code> constructor specify what will happen when the button is tapped. In the example above, the button will send a message to "self" (that is, the layer that holds the button) and call the <code>buttonOneAction</code> method. So this means you'll have to write a new method in the layer called "buttonOneAction" and have it do something. Here's my example:</p>
<pre class="brush:cpp">
- (void)buttonOneAction:(id)sender
{
	// Get a reference to the button that was tapped
	CCMenuItemFont *button = (CCMenuItemFont *)sender;
	
	// Have the button spin around!
	[button runAction:[CCRotateBy actionWithDuration:1 angle:360]];
}
</pre>
<p>Pretty simple, eh? With iOS 4, Apple has also introduced the concept of "blocks" (AKA closures) to Objective-C. Some cocos2d methods have block support, so you can write the code you'd want to run in-line. So instead of writing out a new method for code that runs when your button is tapped, you'd just create your button like this (keep in mind this won't work on iOS 3 without extra hackery beyond the scope of this tutorial):</p>
<pre class="brush:cpp">
CCMenuItemFont *buttonOne = [CCMenuItemFont itemFromString:@"Tap Here!" block:^(id sender)
{
	// Get a reference to the button that was tapped
	CCMenuItemFont *button = (CCMenuItemFont *)sender;

	// Have the button spin around!
	[button runAction:[CCRotateBy actionWithDuration:1 angle:360]];
}];
</pre>
<p>The other "most useful" button I'll go over is <code>CCMenuItemImage</code>. This class will load up to three images to be used as a button (normal, active, and disabled states). It is initialized and used in a similar fashion to <code>CCMenuItemFont</code>... you just need to make sure all your images have been added to your Xcode project.</p>
<pre class="brush:cpp">
CCMenuItemImage *buttonTwo = [CCMenuItemImage itemFromNormalImage:@"button-normal.png" selectedImage:@"button-selected.png" disabledImage:@"button-disabled.png" block:^(id sender)
{
	// Get a reference to the button that was tapped
	CCMenuItemImage *button = (CCMenuItemImage *)sender;
	
	// Move the button around
	CCJumpBy *action = [CCJumpBy actionWithDuration:1 position:ccp(windowSize.width / 3, windowSize.height / 3) height:25 jumps:2];
	[button runAction:[CCSequence actions:action, [action reverse], nil]];
}];
</pre>
<p>Finally, let's talk about <code>CCMenuItemToggle</code>. I was a bit confused about this class at first &mdash; I thought it would display multiple buttons in a "radio" style; that is, only one button in the group could be active, and tapping one would disable the others. In reality, <code>CCMenuItemToggle</code> only shows one button at a time, and tapping the button makes the next one "active." A perfect example is an "on/off" button. When it shows "on," tapping it turns the button to "off." Take a look at the following code. When the toggle is tapped, it runs the specified block of code (in this example, we just log which button is selected). In practice, you could modify NSUserDefaults or something. </p>
<pre class="brush:cpp">
// Create on/off buttons to go in toggle group
CCMenuItemFont *buttonThree = [CCMenuItemFont itemFromString:@"ON"];
CCMenuItemFont *buttonFour = [CCMenuItemFont itemFromString:@"OFF"];

// Create toggle group that logs the active button - the group is then added to a menu same as any other menu item
CCMenuItemToggle *toggleGroup = [CCMenuItemToggle itemWithBlock:^(id sender)
{ 
	NSLog(@"Selected button: %i", [(CCMenuItemToggle *)sender selectedIndex]); 
} items:buttonThree, buttonFour, nil];
</pre>
<p><a href="http://ganbarugames.com/wp-content/uploads/2011/01/menu-button-tutorial-screenshot.png"><img src="http://ganbarugames.com/wp-content/uploads/2011/01/menu-button-tutorial-screenshot-150x79.png" alt="Screenshot of the tutorial Xcode project" title="Screenshot of the tutorial Xcode project" width="150" height="79" class="alignleft size-thumbnail wp-image-216" /></a>With that, you should have a good grasp of menus and buttons in cocos2d. Feel free to download an <a href='http://ganbarugames.com/wp-content/uploads/2011/01/ButtonExample.zip'>Xcode project with some of the sample code used in this tutorial</a>, and ask any questions you might have in the comments. Thanks for reading!</p>
