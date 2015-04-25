---
layout: post
status: publish
published: true
title: color + shape postmortem
author:
  display_name: nathan
  login: nathan
  email: ndemick@gmail.com
  url: ''
author_login: nathan
author_email: ndemick@gmail.com
wordpress_id: 408
wordpress_url: http://ganbarugames.com/?p=408
date: '2011-09-27 15:08:19 -0400'
date_gmt: '2011-09-27 19:08:19 -0400'
categories:
- Games
tags:
- app store
- ganbaru games
- creative process
- color + shape
- postmortem
comments:
- id: 58
  author: Louie
  author_email: 1923coupe@gmail.com
  author_url: ''
  date: '2011-10-24 00:57:00 -0400'
  date_gmt: '2011-10-24 04:57:00 -0400'
  content: |-
    Hello Nathan, I've been meaning to Thank You for the App Store Promo Code.  I live in Japan, but my Apple ID account is set up in the US.  I personally think the game itself is very well put together.  The sounds and effects all excellent.  Although I will be honest, I can't seem to play it more than 5-10 minutes at a time.  The excitement factor is not quite there.  It definitely has potential though.  Maybe adding some animated scenes when more than 3 sets are destroyed.  Or a combo count.  Maybe create an interesting plot.  For example, every bar (4 shapes) created fuels a "Train" and you have to reach a predetermined distance, or your train will become consumed by a huge "Monster"?!  Something like that.  I've noticed Japanese like story type games like that.
    Anyways, Thanks Again, 
    Louie
- id: 59
  author: Nathan
  author_email: ndemick@gmail.com
  author_url: http://ganbarugames.com
  date: '2011-10-25 17:36:00 -0400'
  date_gmt: '2011-10-25 21:36:00 -0400'
  content: |-
    Hey Louie,

    I like your "meta-game" idea. You're right, the core mechanic is interesting but just not interesting enough to stand by itself. If I find myself with some free time, I could definitely see myself going back and updating the game enough to where it's playable for longer periods of time.
---
<p>Uh, so I'm not sure how cool it is to slag on your own games, but I'm not really excited about color + shape. A number of things were frustrating about developing it, and I definitely learned a few lessons that I'll carry on to future projects.</p>
<ol>
<li><strong>The game isn't interesting.</strong> I had the idea for this type of game back before I started doing serious iOS development. It was one of those "Oh, that might be fun." type of ideas. Unfortunately, this sort of game has really been done to death. It's not original, and doesn't hold my interest for any prolonged amount of time. Why did I start and continue development? At first I started so that I could tell myself that I tried the idea. Then, as I sank more time into the project, I didn't want to "give up," as I viewed it. Two lessons here. <strong>The first</strong> is to only start projects that I can really be proud about and have fun playing. Life is too short to waste on making projects that you don't care 100% about. color + shape might be something great to show a potential employer, but it means pretty much nothing as a marketable game. I'd love to submit it to some iOS gaming sites, but it's really so unoriginal that I can't imagine anyone taking an interest in it. <strong>The second</strong> is to kill projects that you're not excited to finish and are not marketable. Now, it's obviously important to finish <em>some</em> projects, but I spent four months on color + shape that would have been better spent elsewhere.</li>
<li><strong>Localization didn't have any effect.</strong> In the first few days of downloads, I didn't get any sales from Japan. At first, I thought there was something wrong with my localized App Store listing. Nope, nothing wrong, I guess the game doesn't look appealing to Japanese people. Maybe the keywords I chose weren't very good? Who knows? Now, it wasn't a whole lot of extra work to localize the game, but it definitely wasn't worth it. I might try to add a Japanese localization to another project, just as another attempt, but I'm pretty discouraged by my first effort. Maybe it's just the fact that the game isn't very interesting and I haven't promoted it at all, but I would expect to see at least a few organic downloads.</li>
</ol>
<p>There were a few positive things that came out of making the game, though. </p>
<ol>
<li>I learned a heck of a lot more about manipulating arrays for grid-based games. I have a decent collection of code that I can reuse if I ever decide to make another one.</li>
<li>I was able to experiment more with cocos2d "actions," which helped me a lot in my Nonogram Madness update.</li>
<li>I finally updated to Xcode 4 and learned how to localize image resources.</li>
</ol>
<p>In conclusion, I feel like the game is still a good thing to have in my portfolio, if only to remind me of the fact that execution is not enough; the idea and design of a game has to be solid in order for me to finish making it.</p>
