---
layout: post
status: publish
published: true
title: NS(Mutable)Array tips
author:
  display_name: nathan
  login: nathan
  email: ndemick@gmail.com
  url: ''
author_login: nathan
author_email: ndemick@gmail.com
wordpress_id: 336
wordpress_url: http://ganbarugames.com/?p=336
date: '2011-06-01 12:32:38 -0400'
date_gmt: '2011-06-01 16:32:38 -0400'
categories:
- Programming
tags:
- programming
- objective-c
- NSArray
- NSMutableArray
comments: []
---
<p>The game I'm currently working on is a color-matching game, where the puzzle tiles are arranged on a grid. Obviously, the data structure you'd use for such a game is an array. While you could use a regular C array, NSMutableArray has a few advantages. It's true that NSArray/NSMutableArray are slower than regular C arrays, but in most (or all) cases, you won't see any performance issues because of it. </p>
<p>First of all, there are lots of convenience methods in the <a href="http://developer.apple.com/library/ios/#documentation/cocoa/reference/foundation/Classes/NSArray_Class/NSArray.html">NSArray</a>/<a href="http://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/Classes/NSMutableArray_Class/Reference/Reference.html">NSMutableArray</a> classes that make it easy to be lazy. If you're used to working with arrays in scripting languages, you probably don't want to go back to using C-style arrays. NSArray allows you to easily search/sort your data. Second, NSArray can be easily serialized, which allows you to save/restore your data in order to support multitasking. <a href="http://ganbarugames.com/nonogram-madness/">Nonogram Madness</a> uses an NSArray to store the player's game when the app moves to the background.</p>
<p>Anyway, here are a few tips that I've found whilst mucking around with NSMutableArray... hopefully you can use them in your next puzzle game.</p>
<ol>
<li>The <code>– removeObjectAtIndex:</code> method will remove the specified object from your array, but then will also shift the indices of the elements beyond <em>index</em> down by one, filling the gap that was created. So, to perform logic that behaves like PHP's <code>array_shift</code>, you could do something like this:
<pre class="brush:cpp">
id myObject = [myMutableArray objectAtIndex:0];
[myMutableArray removeObjectAtIndex:0];
</pre>
</li>
<li>You can easily use just one array to simulate a 2D array. This has an advantage when working with NSMutableArray, because the nested message passing syntax can get pretty hairy when querying an array inside an array. Just store the size of your grid as integers, and derive the x/y position of an object based on its' index.
<pre class="brush:cpp">
// Size of grid - 10x10
int rows = 10;
int cols = 10;

int index = 83;

int x = index % cols;
int y = floor(index / rows);
// Results in x, y == 3, 8
</pre>
</li>
<li>Since removing objects from an NSMutableArray actually shortens the array, what do you do when you want to remove objects but preserve the "empty space" they should leave? Use <a href="http://developer.apple.com/library/mac/#documentation/Cocoa/Conceptual/NumbersandValues/Articles/Null.html">NSNull</a> of course. NSNull is specifically used in arrays/collections that can't store a <em>nil</em> value. Instead of removing the object from your array, do one of these numbers:
<pre class="brush:cpp">
[myMutableArray replaceObjectAtIndex:0 withObject:[NSNull null]];

if ([myMutableArray objectAtIndex:0] == [NSNull null])
{
    NSLog(@"That index is empty!");
}
</pre>
</li>
</ol>
<p>Have any other tricks or advice for using NSArray? Let me know in the comments!</p>
