---
layout: post
status: publish
published: true
title: Resolution Woes
author:
  display_name: nathan
  login: nathan
  email: ndemick@gmail.com
  url: ''
author_login: nathan
author_email: ndemick@gmail.com
wordpress_id: 534
wordpress_url: http://ganbarugames.com/?p=534
date: '2012-05-09 20:49:59 -0400'
date_gmt: '2012-05-10 00:49:59 -0400'
categories:
- Programming
- Meta
tags:
- programming
- cocos2d
- ui
comments:
- id: 100
  author: Experimenting with Javascript | Ganbaru Games
  author_email: ''
  author_url: http://ganbarugames.com/2012/06/experimenting-javascript/
  date: '2012-06-26 11:57:52 -0400'
  date_gmt: '2012-06-26 15:57:52 -0400'
  content: '[...] Ganbaru Games     &larr; Resolution Woes [...]'
---
<p>Oh, my unbridled naivety! My last post discussed a new game, and how quickly it was coming together. Of course, any project is easy to start, and the real difficulty is dealing with the soul-crushing minor issues that rear their heads when you're almost done. In my case, dealing with image assets for 3 different screen resolutions (I use iPhone @2x assets for iPad) has sucked up a lot of time, and caused me to write my own custom class to superimpose TTF labels on top of image-based buttons, instead of creating hundreds of static button images. My game isn't even very complex, so I can't imagine the pain that an extra @4x resolution would cause for other developers.</p>
<p>All this annoyance from creating UI using static images has made me wish for the flexibility of CSS when programming interfaces. So much so, in fact, that the next project I start is going to use a combination of HTML, CSS3, Backbone.js and CoffeeScript, all wrapped together with Apache Cordova. It's not the Canvas- or WebGL-based future that many envision, but manipulating the DOM will allow me to use CSS3 for graphics. It's not like the puzzle games I've been making are very demanding in terms or performance, either. The lure of this new tech combination is so tempting that I have to actively resist the urge to re-write Shikaku Madness, but I'm holding strong and will finish up the Objective-C version before starting anything else.</p>
<p>Anyway, for you fine folks who are getting annoyed with creating UI assets in multiple resolutions, here's a simple class I wrote to hopefully streamline the process: <code>CCMenuItemImageWithLabel</code>.</p>
<pre class="brush:cpp">
//  CCMenuItemImageWithLabel.h
//
//  Created by Nathan Demick on 4/17/12.
//  Copyright 2012 Ganbaru Games. All rights reserved.
//

#import "cocos2d.h"

@interface CCMenuItemImageWithLabel : CCMenuItemImage
{
    // Label w/ text on the button
    CCLabelTTF *label;
}

@property (nonatomic, retain) CCLabelTTF *label;

+ (id)itemWithText:(NSString *)text block:(void(^)(id sender))block;
+ (id)itemWithText:(NSString *)text size:(NSString *)size block:(void(^)(id sender))block;

@end
</pre>
<p>Basically all this class does is help you add a TTF label onto a blank button background. There's a method for creating a default sized button, and another that you can customize to handle multiple button sizes (I have small, normal, and large in my app). Check the implementation:</p>
<pre class="brush:cpp">
//  CCMenuItemImageWithLabel.m
//
//  Created by Nathan Demick on 4/17/12.
//  Copyright 2012 Ganbaru Games. All rights reserved.
//

#import "CCMenuItemImageWithLabel.h"

#define kFontName @"insolent.otf"

#define kDefaultFontSize 24
#define kLargeFontSize 26
#define kSmallFontSize 14

#define kDefaultNormalImage @"button-background.png"
#define kDefaultSelectedImage @"button-background-selected.png"
#define kLargeNormalImage @"large-button-background.png"
#define kLargeSelectedImage @"large-button-background-selected.png"
#define kSmallNormalImage @"small-button-background.png"
#define kSmallSelectedImage @"small-button-background-selected.png"


@implementation CCMenuItemImageWithLabel

@synthesize label;

- (id)init
{
    if ((self = [super init]))
    {
    }
    return self;
}


+ (id)itemWithText:(NSString *)text block:(void(^)(id sender))block
{
    int fontMultiplier = 1;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        fontMultiplier = 2;
    }
    
    // Create button
    CCMenuItemImageWithLabel *item = [self itemFromNormalImage:kDefaultNormalImage selectedImage:kDefaultSelectedImage disabledImage:nil block:block];
    
    // Create label + append to button
    item.label = [CCLabelTTF labelWithString:text dimensions:CGSizeMake(item.contentSize.width, item.contentSize.height) alignment:CCTextAlignmentCenter fontName:kFontName fontSize:kDefaultFontSize * fontMultiplier];
    item.label.color = ccc3(0, 0, 0);    // Tweak this based on your button background image
    item.label.position = ccp(item.contentSize.width / 2.1, item.contentSize.height / 8);    // Tweak this based on your button background image
    [item addChild:item.label];
    
    // Return button
	return item;
}

+ (id)itemWithText:(NSString *)text size:(NSString *)size block:(void(^)(id sender))block
{
    int fontMultiplier = 1;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        fontMultiplier = 2;
    }
    
    // Create button
    CCMenuItemImageWithLabel *item;
    
    if ([size isEqualToString:@"small"])
    {
        item = [self itemFromNormalImage:kSmallNormalImage selectedImage:kSmallSelectedImage disabledImage:nil block:block];
        item.label = [CCLabelTTF labelWithString:text dimensions:CGSizeMake(item.contentSize.width, item.contentSize.height) alignment:CCTextAlignmentCenter fontName:kFontName fontSize:kSmallFontSize * fontMultiplier];
        item.label.position = ccp(item.contentSize.width / 2.1, item.contentSize.height / 10.5);    // Tweak this based on your button background image
    }
    else if ([size isEqualToString:@"large"])
    {
        item = [self itemFromNormalImage:kLargeNormalImage selectedImage:kLargeSelectedImage disabledImage:nil block:block];
        item.label = [CCLabelTTF labelWithString:text dimensions:CGSizeMake(item.contentSize.width, item.contentSize.height) alignment:CCTextAlignmentLeft fontName:kFontName fontSize:kLargeFontSize * fontMultiplier];
        item.label.position = ccp(item.contentSize.width / 1.8, item.contentSize.height / 8);    // Tweak this based on your button background image
    }
    // Default
    else
    {
        item = [self itemFromNormalImage:kDefaultNormalImage selectedImage:kDefaultSelectedImage disabledImage:nil block:block];
        item.label = [CCLabelTTF labelWithString:text dimensions:CGSizeMake(item.contentSize.width, item.contentSize.height) alignment:CCTextAlignmentCenter fontName:kFontName fontSize:kDefaultFontSize * fontMultiplier];
        item.label.position = ccp(item.contentSize.width / 2.1, item.contentSize.height / 8);    // Tweak this based on your button background image
    }
    
    // Create label + append to button
    item.label.color = ccc3(0, 0, 0);    // Tweak this based on your button background image
    [item addChild:item.label];
    
    // Return button
	return item; 
}

@end
</pre>
<p>Not very elegant, but you get the idea. Hopefully you can use this as a starting point to help shorten the time you spend doing grunt production work on UI resources. Any other tips or suggestions for dealing with multiple devices and screen resolutions? Hit me up in the comments.</p>
