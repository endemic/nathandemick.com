---
layout: post
status: publish
published: true
title: How to Save Data with NSUserDefaults
author:
  display_name: nathan
  login: nathan
  email: ndemick@gmail.com
  url: ''
author_login: nathan
author_email: ndemick@gmail.com
wordpress_id: 244
wordpress_url: http://ganbarugames.com/?p=244
date: '2011-02-13 08:00:22 -0500'
date_gmt: '2011-02-13 13:00:22 -0500'
categories:
- Programming
- Tutorial
tags:
- programming
- iOS
- tutorial
- objective-c
comments:
- id: 54
  author: Mbi_studio
  author_email: mbi_studio@mac.com
  author_url: ''
  date: '2011-09-27 13:22:00 -0400'
  date_gmt: '2011-09-27 17:22:00 -0400'
  content: 'Great! This worked perfectly! '
- id: 103
  author: Abhishek Sonawane
  author_email: ''
  author_url: http://www.facebook.com/abhisonawane87
  date: '2012-07-04 02:13:00 -0400'
  date_gmt: '2012-07-04 06:13:00 -0400'
  content: great it worked for me as well,, I stored the image data in it.......
- id: 130
  author: Understanding registerDefaults
  author_email: ''
  author_url: http://www.fantageek.com/1009/understanding-registerdefaults/
  date: '2014-06-01 02:03:52 -0400'
  date_gmt: '2014-06-01 06:03:52 -0400'
  content: '[&#8230;] Quoted from How to Save Data with NSUserDefaults  [&#8230;]'
---
<p>A common requirement for any sort of computer program is saving data. In iOS, probably the simplest way of saving information about your app is using <a href="http://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/Classes/NSUserDefaults_Class/Reference/Reference.html">NSUserDefaults</a>. In a nutshell, NSUserDefaults is a dictionary that will automatically save and load its' state when your app opens and closes. I've used the NSUserDefaults class to save preferences (such as music on or off), as well as store info about the player's progress through my game (whether a level is completed, best completion time, etc).</p>
<p>The best thing about NSUserDefaults is that it's super easy to use. To set a default value:</p>
<pre class="brush:cpp">
NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
[defaults setBool:TRUE forKey:@"shouldPlayMusic"];
[defaults synchronize];
</pre>
<p>To get that same value back:</p>
<pre class="brush:cpp">
NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
Boolean shouldPlayMusic = [defaults boolForKey:@"shouldPlayMusic"];
</pre>
<p>And of course, the best part is that's all you have to do &mdash; you don't have to worry about serialization or saving to disk or whatever.</p>
<p>Another tip is that you can initialize your NSUserDefaults with a pre-defined NSDictionary object. So for example you could set a default value to be "false" or "true" before the user ever had a chance to interact with your program. In my case, sometimes I create an array that represents all the levels in my game, and in each array value I store a boolean to check if a player has finished the level. To do this I create the data object and then register it with NSUserDefaults. If a previous value exists for the object, then nothing happens. Otherwise my blank object gets saved as the "default" defaults. </p>
<p>Even better, you can define your standard defaults by using a .plist:</p>
<pre class="brush:cpp">
NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
[defaults registerDefaults:[NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"UserDefaults" ofType:@"plist"]]];
</pre>
<p>In this example I've got a file named <code>UserDefaults.plist</code> in my project, which is a dictionary that has the default keys and objects I want my app to start with. For more examples, check out <a href="http://developer.apple.com/library/mac/#documentation/Cocoa/Conceptual/UserDefaults/Tasks/UsingDefaults.html">Apple's reference page</a>.</p>
