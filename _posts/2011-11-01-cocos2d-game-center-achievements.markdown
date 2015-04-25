---
layout: post
status: publish
published: true
title: cocos2d + Game Center Achievements
author:
  display_name: nathan
  login: nathan
  email: ndemick@gmail.com
  url: ''
author_login: nathan
author_email: ndemick@gmail.com
wordpress_id: 422
wordpress_url: http://ganbarugames.com/?p=422
date: '2011-11-01 16:03:54 -0400'
date_gmt: '2011-11-01 20:03:54 -0400'
categories:
- Programming
- Tutorial
tags:
- tutorial
- game center
- achievements
comments:
- id: 88
  author: Harold Li
  author_email: harold.hf.li@gmail.com
  author_url: ''
  date: '2012-03-07 12:37:00 -0500'
  date_gmt: '2012-03-07 17:37:00 -0500'
  content: |-
    Great tutorial. Just want to make a note though that 

    - (void)reportAchievementIdentifier:(NSString *)identifier incrementPercentComplete:(float)percent

    no longer works the way as you have intended. achievement.percentComplete is a assign only property, so trying to read it would return null.
- id: 89
  author: Adding Game Center or Open Feint, is it worthy? - iPhone Dev SDK Forum
  author_email: ''
  author_url: http://www.iphonedevsdk.com/forum/iphone-sdk-game-development/75318-adding-game-center-open-feint-worthy.html#post416040
  date: '2012-03-09 18:47:37 -0500'
  date_gmt: '2012-03-09 23:47:37 -0500'
  content: '[...] links I used. I made a singleton class that has all the GC stuff
    inside.   cocos2d + Game Center Achievements | Ganbaru Games  iOS Game Center
    Achievement Display | Tech-Wanderings of Greg Holsclaw  [...]'
- id: 91
  author: Nathan
  author_email: ndemick@gmail.com
  author_url: http://ganbarugames.com
  date: '2012-03-16 11:20:00 -0400'
  date_gmt: '2012-03-16 15:20:00 -0400'
  content: Right on, is that a change in 5.0? I'm going to have to update my apps
    to support the new iPad, so that's something I'll definitely have to test.
---
<p>If you've been following along on the blog, I posted a few months ago about <a href="http://ganbarugames.com/2011/07/cocos2d-game-center/" title="cocos2d + Game Center">how to easily integrate Game Center leaderboards</a> into your cocos2d game. Game Center is pretty great, because Apple writes basically all of the code for you, and they also provide a web-based interface to create your content. </p>
<p>My previous tutorial was just about setting up leaderboards. Today I'm going to expand on that, and add in some methods to the Game Center singleton that will allow you to report achievements. Achievements are a bit different than leaderboards in that when you connect a player to Game Center, that player's current achievement status is returned from Apple's servers. Sending leaderboard scores are just fire and forget, but for achievements you have to figure out their completion status and increment that value, then send it back. Like I said, Apple writes all the GameKit classes that deal with interacting with Game Center, and they also provide <a href="http://developer.apple.com/library/ios/#documentation/NetworkingInternet/Conceptual/GameKit_Guide/Achievements/Achievements.html#//apple_ref/doc/uid/TP40008304-CH7-SW13" title="Apple's GameKit developer documentation">example code</a> which basically works right out of the box. In fact, I only had to write one method of my own when implementing achievements, and that was for my own convenience.</p>
<p>Bust out your GameCenterManager class and add some properties and methods to the header file:</p>
<pre class="brush:js">
// Store unsent Game Center data
NSMutableArray *unsentAchievements;
	
// Store saved Game Center achievement progress
NSMutableDictionary *achievementsDictionary;

// Achievement methods
- (GKAchievement *)getAchievementForIdentifier:(NSString *)identifier;
- (void)reportAchievementIdentifier:(NSString *)identifier percentComplete:(float)percent;
- (void)reportAchievementIdentifier:(NSString *)identifier incrementPercentComplete:(float)percent;
- (void)showAchievements;
- (void)achievementViewControllerDidFinish:(GKAchievementViewController *)viewController;
</pre>
<p>These properties and methods should look pretty self-explanitory if you've already read through the previous tutorial. The <code>unsentAchievements</code> array is used to store achievement reports that can't be sent to Apple for some reason (e.g. network timeout). The next time the user is authenticated, the manager class tries to resend the data. <code>achievementsDictionary</code> stores a player's existing achievements locally, so we can quickly check completion status without having to use a network connection each time. The first method is only used internally by the other methods as an easy way to query the <code>achievementsDictionary</code>. The next two methods are used to report achievement progress, while the last two deal with displaying the achievement progress.</p>
<p>The first thing we have to do is load a player's existing achievement completion percentage from Game Center after they are successfully authenticated. In the <code>- (void)authenticateLocalPlayer</code> method, after the <code>if (localPlayer.isAuthenticated)</code> conditional, add the following code to load achievements into the <code>achievementsDictionary</code> object you added to the singleton.</p>
<pre class="brush:js">
// Load player achievements
[GKAchievement loadAchievementsWithCompletionHandler:^(NSArray *achievements, NSError *error) {
	if (error != nil)
	{
		// handle errors
	}
	if (achievements != nil)
	{
		// process array of achievements
		for (GKAchievement* achievement in achievements)
			[achievementsDictionary setObject:achievement forKey:achievement.identifier];
	}
}];
</pre>
<p>Next let's look at the implementation of the methods we defined earlier. These are all taken from Apple's example documentation, except for <code>- (void)reportAchievementIdentifier:(NSString *)identifier incrementPercentComplete:(float)percent</code> which is just a simple modification that I thought was convenient.</p>
<pre class="brush:js">
#pragma mark -
#pragma mark Achievement methods

/**
 * Get an achievement object in the locally stored dictionary
 */
- (GKAchievement *)getAchievementForIdentifier:(NSString *)identifier
{
	if (hasGameCenter)
	{
		GKAchievement *achievement = [achievementsDictionary objectForKey:identifier];
		if (achievement == nil)
		{
			achievement = [[[GKAchievement alloc] initWithIdentifier:identifier] autorelease];
			[achievementsDictionary setObject:achievement forKey:achievement.identifier];
		}
		return [[achievement retain] autorelease];
	}
	return nil;
}

/**
 * Send a completion % for a specific achievement to Game Center
 */
- (void)reportAchievementIdentifier:(NSString *)identifier percentComplete:(float)percent
{
	if (hasGameCenter)
	{
		// Instantiate GKAchievement object for an achievement (set up in iTunes Connect)
		GKAchievement *achievement = [self getAchievementForIdentifier:identifier];
		if (achievement)
		{
			achievement.percentComplete = percent;
			[achievement reportAchievementWithCompletionHandler:^(NSError *error)
			{
				if (error != nil)
				{
					// Retain the achievement object and try again later
					[unsentAchievements addObject:achievement];

					NSLog(@"Error sending achievement!");
				}
			}];
		}
	}
}

/**
 * Send a completion % for a specific achievement to Game Center - increments an existing achievement object
 */
- (void)reportAchievementIdentifier:(NSString *)identifier incrementPercentComplete:(float)percent
{
	if (hasGameCenter)
	{
		// Instantiate GKAchievement object for an achievement (set up in iTunes Connect)
		GKAchievement *achievement = [self getAchievementForIdentifier:identifier];
		if (achievement)
		{
			achievement.percentComplete += percent;
			[achievement reportAchievementWithCompletionHandler:^(NSError *error)
			 {
				 if (error != nil)
				 {
					 // Retain the achievement object and try again later
					 [unsentAchievements addObject:achievement];
					 
					 NSLog(@"Error sending achievement!");
				 }
			 }];
		}
	}
}
</pre>
<p>You can see that these reporting methods are very similar to the reporting methods used for leaderboards. Each one tries to get an existing achievement object from your local cache of achievement data, set the percentage complete (or increment it), then send to Apple. If the report fails, the <code>GKAchievement</code> object gets temporarily stored locally, and will attempt to be sent again later. I added the <code>- (void)reportAchievementIdentifier:(NSString *)identifier incrementPercentComplete:(float)percent</code> method because it was easier to just have each successfully completed level in my game add a certain percentage towards completion status. For example, you have 20 levels, so each level just adds 5% to the total. That way you don't have to find the previous completion percentage of the achievement object.</p>
<p>The next methods are straight from Apple's example code; the only thing changed here is that we attach the <code>UIViewController</code> that shows a player's achievements directly to cocos2d's OpenGL view. This will show the default "green baize" style Game Center UI; if you want your own custom UI, that's something you can do, but outside the scope of this tutorial.</p>
<pre class="brush:js">
/**
 * Create a GKAchievementViewController and display it on top of cocos2d's OpenGL view
 */
- (void)showAchievements
{
	if (hasGameCenter)
	{
		GKAchievementViewController *achievements = [[GKAchievementViewController alloc] init];
		if (achievements != nil)
		{
			achievements.achievementDelegate = self;
			
			// Create an additional UIViewController to attach the GKAchievementViewController to
			myViewController = [[UIViewController alloc] init];
			
			// Add the temporary UIViewController to the main OpenGL view
			[[[CCDirector sharedDirector] openGLView] addSubview:myViewController.view];
			
			[myViewController presentModalViewController:achievements animated:YES];
		}
		[achievements release];
	}
}

/**
 * Dismiss an active GKAchievementViewController
 */
- (void)achievementViewControllerDidFinish:(GKAchievementViewController *)viewController
{
	[myViewController dismissModalViewControllerAnimated:YES];
	[myViewController release];
}
</pre>
<p>The last thing you'll have to do before you can actually use these reporting methods in your game is set up the achievements in iTunes Connect. Create a new app entry for your game and enable Game Center for it. Next, go into the "Configure Game Center" section and set up your achievements. The interface is really so simple that you should be able to figure it out easily. The most important part is to take note of each achievement ID string that you create, as these will be used in your code to reference each achievement. For example, in <a href="/nonogram-madness/" title="Nonogram Madness">Nonogram Madness</a>, when a player successfully completes an easy randomized level, I make a call with the GameCenterManager like this:</p>
<pre class="brush:js">
[[GameCenterManager sharedGameCenterManager] reportAchievementIdentifier:@"com.ganbarugames.nonogrammadness.random_easy" incrementPercentComplete:10.0];
</pre>
<p>And that's all there is to it! <a href='http://ganbarugames.com/wp-content/uploads/2011/11/GameCenterManager_v2.zip'>Download the example source</a>, and if you have any questions, feel free to leave a comment or get in touch on <a href="http://www.twitter.com/ganbarugames" title="@ganbarugames on Twitter">Twitter</a>.</p>
