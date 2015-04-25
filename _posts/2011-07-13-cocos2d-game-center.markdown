---
layout: post
status: publish
published: true
title: cocos2d + Game Center
author:
  display_name: nathan
  login: nathan
  email: ndemick@gmail.com
  url: ''
author_login: nathan
author_email: ndemick@gmail.com
wordpress_id: 344
wordpress_url: http://ganbarugames.com/?p=344
date: '2011-07-13 17:02:59 -0400'
date_gmt: '2011-07-13 21:02:59 -0400'
categories:
- Programming
- Tutorial
tags:
- programming
- tutorial
- objective-c
- revolve ball
- game center
- game kit
comments:
- id: 37
  author: Phoenixongogo
  author_email: phoenixongogo@gmail.com
  author_url: ''
  date: '2011-07-14 23:39:00 -0400'
  date_gmt: '2011-07-14 23:39:00 -0400'
  content: |-
    that's really a wonderful tutorial!!
    Thanks for your sharing =)
- id: 38
  author: Bobj-c
  author_email: infinitybob@gmail.com
  author_url: ''
  date: '2011-07-15 09:10:00 -0400'
  date_gmt: '2011-07-15 09:10:00 -0400'
  content: Very useful Thanks
- id: 44
  author: Stefan Edberg
  author_email: stefan@osynlig.se
  author_url: ''
  date: '2011-08-15 15:01:00 -0400'
  date_gmt: '2011-08-15 15:01:00 -0400'
  content: |+
    Hi! I'm having trouble displaying the leaderboard for my game.

    This is my applicationDidFinishLaunching:
















    [GameCenterManager loadState];
        GameCenterManager *gameCenterManager = [GameCenterManager sharedGameCenterManager];
    [gameCenterManager authenticateLocalPlayer];Works perfectly, but when I click on my leaderboard-button it won't show. I've tried creating it manually, and the viewcontroller is added but nothing I put in presentModalViewController shows. I tried setting a background color on myViewController, and commented out the presentModalViewController and it works.The only log I get is "cocos2d: surface size: 480x320".When I click the leaderboard button:







    [gameCenterManager showLeaderboardForCategory:@"owl"];

    I've updated Cocos2d to 1.0.1 without any luck.

    Help appreciated!







- id: 45
  author: Nathan
  author_email: ndemick@gmail.com
  author_url: http://ganbarugames.com
  date: '2011-08-15 15:26:00 -0400'
  date_gmt: '2011-08-15 15:26:00 -0400'
  content: |-
    Hey Stefan,

    The code should pretty much work "out of the box". Can you verify that you set up the leaderboard in iTunes Connect and enabled Game Center for your app? The "Game Center" config in your app page should look something like the attached image once you've set everything up. Also, I'd make sure that the bundle ID you have for your app in Xcode is the same as the bundle ID you entered in iTunes Connect (e.g. com.ganbarugames.myappname). 
- id: 46
  author: SK
  author_email: 179378968@qq.com
  author_url: ''
  date: '2011-08-16 02:42:00 -0400'
  date_gmt: '2011-08-16 02:42:00 -0400'
  content: same problem with Stefan
- id: 47
  author: Stefan Edberg
  author_email: stefan@osynlig.se
  author_url: ''
  date: '2011-08-16 06:20:00 -0400'
  date_gmt: '2011-08-16 06:20:00 -0400'
  content: |-
    Hi Nathan,

    Thanks for your reply! 

    I had the same problem with an empty view controller (with background color). I solved it though.

    I found a solution that works for me. Instead of creating a temporary view controller I use my RootViewController:









    AppDelegate * delegate = (AppDelegate *) [UIApplication sharedApplication].delegate;
    [delegate.viewController presentModalViewController:leaderboardController animated:YES];







    - (void)leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
    {
        //[myViewController dismissModalViewControllerAnimated:YES];
        //[myViewController release];
        [viewController becomeFirstResponder];
        [viewController dismissModalViewControllerAnimated:YES];
    }
- id: 60
  author: '&raquo; Game Center: Leaderboard unexpect3rd developments'
  author_email: ''
  author_url: http://www.unexpect3rd.com/?p=48
  date: '2011-10-26 03:14:17 -0400'
  date_gmt: '2011-10-26 07:14:17 -0400'
  content: '[...] This is the tutorial I referred to : cocos2d + GameCenter by Ganbaru
    Games [...]'
- id: 61
  author: cocos2d + Game Center Achievements | Ganbaru Games
  author_email: ''
  author_url: http://ganbarugames.com/2011/11/cocos2d-game-center-achievements/
  date: '2011-11-01 16:04:02 -0400'
  date_gmt: '2011-11-01 20:04:02 -0400'
  content: '[...] you&#8217;ve been following along on the blog, I posted a few months
    ago about how to easily integrate Game Center leaderboards into your cocos2d game.
    Game Center is pretty great, because Apple writes basically all of the code [...]'
- id: 101
  author: Veterans_of_war
  author_email: veterans_of_war@yahoo.com
  author_url: ''
  date: '2012-06-28 01:35:00 -0400'
  date_gmt: '2012-06-28 05:35:00 -0400'
  content: Hey, this is an awesome tutorial but could you show us how to get it working
    in landscape mode, more specifically showing the leaderboard? It shows up from
    the left side of the screen, and I have been searching google for hours for fixes,
    cannot seem to get anything working. If possible could you email me at veterans_of_war@yahoo.com
    thanks!
- id: 102
  author: Nathan
  author_email: ndemick@gmail.com
  author_url: http://ganbarugames.com
  date: '2012-06-28 12:38:00 -0400'
  date_gmt: '2012-06-28 16:38:00 -0400'
  content: Hey, unfortunately all my games use portrait mode, so I don't know off
    the top of my head. This guy (http://stackoverflow.com/questions/4068264/cocos-2d-and-game-center-leaderboard-issue) seems
    to have found a solution by setting his autorotation option to use the CCDirector.
    Another solution might be to attach the Game Center view to your rootViewController,
    like Stefan Edburg did in the comments below, to pick up the correct orientation.
- id: 106
  author: いろいろ搭載 | おっさんフリーター(36)がアプリ作る
  author_email: ''
  author_url: http://sarudeki.jp/hchibee/2012/07/17/%e3%81%84%e3%82%8d%e3%81%84%e3%82%8d%e6%90%ad%e8%bc%89/
  date: '2012-07-17 02:07:44 -0400'
  date_gmt: '2012-07-17 06:07:44 -0400'
  content: '[...] 同じくGameCenter [...]'
- id: 107
  author: Steve
  author_email: veterans_of_war@yahoo.com
  author_url: ''
  date: '2012-07-19 21:17:00 -0400'
  date_gmt: '2012-07-20 01:17:00 -0400'
  content:  Where did you put this code? I'm trying to fix this problem in my project
    but can''t seem to figure it out. I've been trying for weeks actually lol
- id: 108
  author: Nathan
  author_email: ndemick@gmail.com
  author_url: http://ganbarugames.com
  date: '2012-07-23 07:21:00 -0400'
  date_gmt: '2012-07-23 11:21:00 -0400'
  content: You should use it in the "showLeaderboardForCategory" method, instead of
    creating a new view controller.
- id: 110
  author: dat nguyen
  author_email: nguyenhdat@gmail.com
  author_url: ''
  date: '2012-08-27 15:45:00 -0400'
  date_gmt: '2012-08-27 19:45:00 -0400'
  content: |-
    I keep getting this error for this [GameCenterManager loadState];








    +[GameCenterManager loadState]: unrecognized selector sent to class 
- id: 111
  author: nathan
  author_email: ndemick@gmail.com
  author_url: ''
  date: '2012-09-05 14:06:42 -0400'
  date_gmt: '2012-09-05 18:06:42 -0400'
  content: Make sure that you copy the contents of the .h file correctly; looks like
    the "loadState" class method isn't declared in the header, for some reason.
- id: 112
  author: Nathan
  author_email: ndemick@gmail.com
  author_url: http://ganbarugames.com
  date: '2012-09-05 14:10:00 -0400'
  date_gmt: '2012-09-05 18:10:00 -0400'
  content: Make sure you copied the entire header file over; it looks like the "loadState"
    class method isn't declared in your header for some reason.
- id: 113
  author: Steve Donald
  author_email: ''
  author_url: http://www.facebook.com/profile.php?id=503156652
  date: '2012-09-12 02:20:00 -0400'
  date_gmt: '2012-09-12 06:20:00 -0400'
  content: 'I have gotten it to show properly. However my app is crashing everytime
    I don''t comment out the whole "if ([unsentScores count] &gt; 0)" section and
    unsentAchievements section. I have checked everything and have implemented them
    correctly. loadState and savestate in my app delegate and such. What could be
    wrong? '
- id: 114
  author: Nathan
  author_email: ndemick@gmail.com
  author_url: http://ganbarugames.com
  date: '2012-09-12 21:28:00 -0400'
  date_gmt: '2012-09-13 01:28:00 -0400'
  content: "Hey Steve,\n\nSorry, been a while since I tried compiling this code. Do
    you get any sort of message in the debugging console when the app crashes? You
    might try adding the following in the \"init\" method, to make sure that the array
    actually exists. Let me know if that works and I'll update the example code.\n\nif
    (unsentScores == nil){\tunsentScores = [[[NSMutableArray alloc] init] retain];}\n\nif
    (unsentAchievements == nil){\tunsentAchievements = [[[NSMutableArray alloc] init]
    retain];}"
- id: 115
  author: Lance Gray
  author_email: lance.gray.dev@gmail.com
  author_url: ''
  date: '2012-09-19 01:27:00 -0400'
  date_gmt: '2012-09-19 05:27:00 -0400'
  content: I tried your GameCenterManager class and it works fine on iPad. But on
    iPhone, the leaderboard is not shown. I traced the build and it turns out that
    all checks and other lines of code tell me that the UIViewController is being
    shown on screen.
- id: 116
  author: Open Game Center UI with Cocos2d-x - feed99
  author_email: ''
  author_url: http://www.feed99.com/2012/09/open-game-center-ui-with-cocos2d-x/
  date: '2012-09-24 03:48:14 -0400'
  date_gmt: '2012-09-24 07:48:14 -0400'
  content: '[...] have set up so that my app can connect to the Game Center. I followed
    this guide and had a C++ class wrapper to call them in my other classes. I&#8217;m
    using iPad (iOS 5.1), [...]'
---
<p>So (for those of you who have been living under a rock) Apple has baked a "social" gaming service for iOS into recent releases called Game Center. Game Center allows its' users to see what games their friends are playing, as well as their own progress in the Game Center-enabled games they own.</p>
<p>For developers, the main advantage to Game Center is that it simplifies the creation of leaderboards and achievements for your game. Prior to Game Center, if you wanted to keep a global list of high scores, you had to write your own web service. Not only did this require a lot of extra work, but it also relied on your users creating an authenticated account with said service. Some dedicated users might create an account that they could only use with your game, but most would not. Game Center helps alleviate this problem by providing a single set of credentials that all games can use. Other services such as OpenFeint did this as well, but OpenFeint had some annoying terms of service (such as requiring their logo in your app icon). Plus, Game Center has kind of an unfair advantage, seeing as how its' a first-party offering integrated into the OS.</p>
<p>An additional advantage of Game Center is that it's dead easy to use. If a mouth breather such as myself can figure it out, then I guarantee that you can too. You create your leaderboards and achievements through a web interface in iTunes Connect; no coding required. All you have to do is wrangle the example code provided by Apple into something that works for your game. Here I'll show you my example of how I implemented leaderboards into Revolve Ball.</p>
<p>I decided that I would make a "GameCenterManager" singleton class, which would then be able to be accessed from anywhere in my game. I also chose the singleton because I had pre-existing code that I could use to save/restore the object's properties in case the app was terminated. Apple recommends that you save any scores/achievements that don't get successfully sent to the Game Center servers, so that you can try sending them again at a later time; being able to save/restore the singleton fit right in with that recommendation.</p>
<p>Apple also provides a reference implementation for <a href="http://developer.apple.com/documentation/Cocoa/Conceptual/CocoaFundamentals/CocoaObjects/CocoaObjects.html#//apple_ref/doc/uid/TP40002974-CH4-SW32" title="creating a singleton instance">creating a singleton instance</a>, but in my web searches I found a <a href="http://cocoawithlove.com/2008/11/singletons-appdelegates-and-top-level.html" title="nice singleton helper">nice singleton helper</a> which automatically creates the code necessary to turn your custom object into a singleton. I'll leave it as an exercise for the reader to download that file and include it in your project.</p>
<p>Let's begin. Take a look at the header file for my <code>GameCenterManager</code> object. I'll keep the extraneous commentary to a minimum, and focus on explaining the code with inline comments.</p>
<pre class="brush:cpp">
#import &lt;GameKit/GameKit.h&gt;
#import "SynthesizeSingleton.h"

// Subclass our object from NSObject - allow it to be serialized, and make it the delegate for the leaderboard view
@interface GameCenterManager : NSObject &lt;NSCoding, GKLeaderboardViewControllerDelegate&gt;
{
	// Boolean that is set to true if device supports Game Center and a player has logged in
	BOOL hasGameCenter;
	
	// An array that holds scores that couldn't be sent to Game Center (network timeout, etc.)
	NSMutableArray *unsentScores;
	
	// The view that shows the default Game Center leaderboards
	UIViewController *myViewController;
}

// Create accessible properties
@property (readwrite) BOOL hasGameCenter;
@property (readwrite, retain) NSMutableArray *unsentScores;

// Time-saving singleton generator - see http://cocoawithlove.com/2008/11/singletons-appdelegates-and-top-level.html
SYNTHESIZE_SINGLETON_FOR_CLASS_HEADER(GameCenterManager);

// These methods are all provided as examples from Apple
- (BOOL)isGameCenterAPIAvailable;
- (void)authenticateLocalPlayer;
- (void)reportScore:(int64_t)score forCategory:(NSString *)category;
- (void)showLeaderboardForCategory:(NSString *)category;
- (void)leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController;

// Serialize/store the variables in this singleton
+ (void)loadState;
+ (void)saveState;

@end
</pre>
<p>You can see that this class is pretty basic. All the class methods (except <code>loadState</code> and <code>saveState</code>) were taken from <a href="http://developer.apple.com/library/ios/#documentation/NetworkingInternet/Conceptual/GameKit_Guide/Introduction/Introduction.html" title="Apple's Game Kit documentation">Apple's Game Kit documentation</a>. They include determining if Game Center is available on the device, authenticating a player, sending a high score, and showing/dismissing the leaderboard view. I added two additional properties, <code>hasGameCenter</code> and <code>unsentScores</code>. The first is a boolean that is true if the device supports Game Center and a player is logged in. Since I weak link Game Kit framework, none of the class methods actually do anything if it is set to false, and I can support the original iPad version of iOS (3.2) which doesn't have Game Center. <code>unsentScores</code> holds any high score that wasn't successfully sent to the leaderboards. The next time the player logs in to Game Center using my game, it tries to send each score again.</p>
<p>Now let's look at the class implementation. Again, most of this is from <a href="http://developer.apple.com/library/ios/#documentation/NetworkingInternet/Conceptual/GameKit_Guide/Introduction/Introduction.html">Apple's reference code</a>. The only bits I added were checking against the <code>hasGameCenter</code> boolean, and the re-sending of any saved scores upon successful authentication. Make sure to read through the documentation to get a better idea of what the Game Kit classes are doing under the hood. </p>
<pre class="brush:cpp">
#import "GameCenterManager.h"
#import "cocos2d.h"

@implementation GameCenterManager

@synthesize hasGameCenter, unsentScores;

// Time-saving singleton generator - see http://cocoawithlove.com/2008/11/singletons-appdelegates-and-top-level.html
SYNTHESIZE_SINGLETON_FOR_CLASS(GameCenterManager);

- (id)init 
{
	if ((self = [super init]))
	{
		// Initialize any class properties here
		if ([self isGameCenterAPIAvailable])
			hasGameCenter = YES;
		else
			hasGameCenter = NO;		
	}
	return self;
}

/**
 Check to see if installed OS supports Game Center
 */
- (BOOL)isGameCenterAPIAvailable
{
	// Check for presence of GKLocalPlayer class
	BOOL localPlayerClassAvailable = (NSClassFromString(@"GKLocalPlayer")) != nil;
	
	// Device must be running 4.1 or later
	NSString *reqSysVer = @"4.1";
	NSString *currSysVer = [[UIDevice currentDevice] systemVersion];
	BOOL osVersionSupported = ([currSysVer compare:reqSysVer options:NSNumericSearch] != NSOrderedAscending);
	
	return (localPlayerClassAvailable && osVersionSupported);
}
</pre>
<p>When the class is instantiated, the singleton runs the <code>isGameCenterAPIAvailable</code> method, which ensures the OS supports Game Center. If true, it sets my own <code>hasGameCenter</code> boolean to true. The rest of my Game Center methods check that boolean, so I can call those methods at any time and not have to worry about device support. If the device doesn't support Game Center or the player can't be authenticated, the leaderboard/score reporting methods just don't do anything.</p>
<pre class="brush:cpp">
/**
 Attempt to authenticate a Game Center user. Will automatically present a modal login window.
 */
- (void)authenticateLocalPlayer
{
	if (hasGameCenter)
	{
		GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];
		[localPlayer authenticateWithCompletionHandler:^(NSError *error) {
			if (localPlayer.isAuthenticated)
			{
				/* Perform additional tasks for the authenticated player here */
				
				// If unsent scores array has length > 0, try to send saved scores
				if ([unsentScores count] > 0)
				{
					// Create new array to help remove successfully sent scores
					NSMutableArray *removedScores = [NSMutableArray array];
					
					for (GKScore *score in unsentScores)
					{
						[score reportScoreWithCompletionHandler:^(NSError *error) {
							if (error != nil)
							{
								// If there's an error reporting the score (again!), leave the score in the array
							}
							else
							{
								// If success, mark score for removal
								[removedScores addObject:score];
							}
						}];
					}
					
					// Remove successfully sent scores from stored array
					[unsentScores removeObjectsInArray:removedScores];
				}
			}
			else
			{
				// Disable Game Center methods - player not authenticated
				hasGameCenter = NO;
			}
		}];
	}
}
</pre>
<p>This method presents the player with a modal window to log in to Game Center. If they are already logged in, they'll see the "Welcome back, so-and-so!" notification pop down from the top of the screen. If the player doesn't get authenticated for some reason (i.e. they dismiss the modal), <code>hasGameCenter</code> is set to false, and Game Center-speicific methods are ignored for the rest of the game session.</p>
<pre class="brush:cpp">
/**
 Send an integer score to Game Center for a particular category (set up category in iTunes Connect)
 */
- (void)reportScore:(int64_t)score forCategory:(NSString *)category
{
	// Only execute if OS supports Game Center & player is logged in
	if (hasGameCenter)
	{
		// Create score object
		GKScore *scoreReporter = [[[GKScore alloc] initWithCategory:category] autorelease];
		
		// Set the score value
		scoreReporter.value = score;
		
		// Try to send
		[scoreReporter reportScoreWithCompletionHandler:^(NSError *error) {
			if (error != nil)
			{
				// Handle reporting error here by adding object to a serializable array, to be sent again later
				[unsentScores addObject:scoreReporter];
			}
		}];
	}
}
</pre>
<p>This is the method used to report a high score to Game Center. However, before you can use it, you'll need to bust out of XCode and go to iTunes Connect to set up the leaderboards your game will use. The first step is to create a new app entry, with an icon, description, screenshots, etc. Go ahead and use placeholder or WIP artwork; you can change all that info later before you upload your first binary. Make sure that the "Enable Game Center" option is checked. When you're finished, navigate to the main app page (the first one that appears after you click the app's icon on the "Manage Your Apps" page). On the right side of the screen, there'll be some buttons for setting up In-App Purchase, Game Center, and iAd. Click the Game Center button, then click the "Set up" button under the Leaderboards header. From there, you'll be able to configure your leaderboard, including setting up a unique string to be used as the leaderboard ID. When you report a score to Game Center, you'll use that string as the "category". For example, I use the above method like this in Revolve Ball:</p>
<pre class="brush:cpp">
[[GameCenterManager sharedGameCenterManager] reportScore:bestTime forCategory:@"com.ganbarugames.revolveball.world_1"];
</pre>
<p>Next, let's look at actually displaying the leaderboard. There are two ways you can do this: use the default Game Center-themed view controller provided by Apple, or get the data and insert it into your own UI. I'm lazy, plus UI programming takes forever, so I opted for the easier method.</p>
<pre class="brush:cpp">
/**
 Show the "green felt" leaderboard view for a particular category
 */
- (void)showLeaderboardForCategory:(NSString *)category
{
	// Only execute if OS supports Game Center & player is logged in
	if (hasGameCenter)
	{
		// Create leaderboard view w/ default Game Center style
		GKLeaderboardViewController *leaderboardController = [[GKLeaderboardViewController alloc] init];
		
		// If view controller was successfully created...
		if (leaderboardController != nil)
		{
			// Leaderboard config
			leaderboardController.leaderboardDelegate = self;	// The leaderboard view controller will send messages to this object
			leaderboardController.category = category;	// Set category here
			leaderboardController.timeScope = GKLeaderboardTimeScopeAllTime;	// GKLeaderboardTimeScopeToday, GKLeaderboardTimeScopeWeek, GKLeaderboardTimeScopeAllTime
			
			// Create an additional UIViewController to attach the GKLeaderboardViewController to
			myViewController = [[UIViewController alloc] init];
			
			// Add the temporary UIViewController to the main OpenGL view
			[[[CCDirector sharedDirector] openGLView] addSubview:myViewController.view];
			
			// Tell UIViewController to present the leaderboard
			[myViewController presentModalViewController:leaderboardController animated:YES];
		}
	}
}

/**
 Since this singleton is the GKLeaderboardViewControlerDelegage, it intercepts this method and removes the view
 */
- (void)leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
	[myViewController dismissModalViewControllerAnimated:YES];
	[myViewController release];
}
</pre>
<p>I'm leaving out the overview for the <code>loadState</code> and <code>saveState</code> methods; an <a href="http://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/Protocols/NSCoding_Protocol/Reference/Reference.html">NSCoding</a> <a href="http://www.raywenderlich.com/1914/how-to-save-your-app-data-with-nscoding-and-nsfilemanager">tutorial</a> would probably be a better place for that. However, you can download the complete <a href='http://ganbarugames.com/wp-content/uploads/2011/06/GameCenterManager.zip'>GameCenterManager class</a> and study them on your own.</p>
<p>The final thing I'll mention is how to instantiate the Game Center singleton when your app starts, and then serialize its' <code>unsentScores</code> array before the app quits (so data doesn't get lost). In your app delegate file, in the <code>applicationDidFinishLaunching</code> method, add this line anywhere to init the object and load any saved data:</p>
<pre class="brush:cpp">
[GameCenterManager loadState];
</pre>
<p>Then, to save before your app quits, put this line in the <code>applicationWillTerminate</code> method in the app delegate file:</p>
<pre class="brush:cpp">
[GameCenterManager saveState];
</pre>
<p>This is just a starting spot for what you can do with Game Center. Hopefully you can take this code to the next level by adding achievement reporting and whatever new gimmicks iOS 5 has in store. Problems or suggestions? Let me know in the comments!</p>
