---
layout: post
status: publish
published: true
title: 'Preview: color + shape'
author:
  display_name: nathan
  login: nathan
  email: ndemick@gmail.com
  url: ''
author_login: nathan
author_email: ndemick@gmail.com
wordpress_id: 370
wordpress_url: http://ganbarugames.com/?p=370
date: '2011-06-24 11:34:56 -0400'
date_gmt: '2011-06-24 15:34:56 -0400'
categories:
- Games
tags:
- iOS
- ganbaru games
- preview
- color + shape
comments:
- id: 33
  author: amsoell
  author_email: disqus@amsoell.com
  author_url: http://andy.teamsoell.com
  date: '2011-06-24 19:29:00 -0400'
  date_gmt: '2011-06-24 19:29:00 -0400'
  content: Looks awesome, can't wait to get my mits on it! iPad support?
- id: 34
  author: Nathan
  author_email: ndemick@gmail.com
  author_url: http://ganbarugames.com
  date: '2011-06-24 19:43:00 -0400'
  date_gmt: '2011-06-24 19:43:00 -0400'
  content: Haha, of course. Now that I have an iPad, there's no excuse. I'm going
    to actually create iPad-specific graphics instead of just using the @2x Retina
    display graphics.
---
<p><a href="http://ganbarugames.com/wp-content/uploads/2011/06/title.png"><img src="http://ganbarugames.com/wp-content/uploads/2011/06/title-200x300.png" alt="" title="color + shape: title" width="200" height="300" class="alignright size-medium wp-image-373" /></a>So, after about two months, I'm finally getting around to showing the current project I'm working on. This is an idea that I've had since before actually learning iOS development. To be honest, it's not very original, but it's kind of a fun diversion. Since I knew that I wouldn't have to create levels, I thought it would be a good test of a two-month development cycle. Unfortunately, due to some other circumstances (namely, a baby that likes to wake up at 5 in the morning), I'm not going to be able to keep that schedule (although it will be pretty close).</p>
<p><a href="http://ganbarugames.com/wp-content/uploads/2011/06/gameplay.png"><img src="http://ganbarugames.com/wp-content/uploads/2011/06/gameplay-200x300.png" alt="" title="color + shape: gameplay" width="200" height="300" class="alignleft size-medium wp-image-372" /></a>My game is going to be entitled <em>color + shape</em>, and is (obviously) a color/shape-matching game. If you've played something like <a href="http://en.wikipedia.org/wiki/Bejeweled">Bejeweled</a>, the concept will probably be pretty easy to understand. The object is to line up four or more blocks with the same color or the same shape on them. A successful match makes the matched blocks disappear, and new random blocks fall to take their place. You only have 30 seconds to make as many matches as you can, but each match puts a small amount of time back into the time limit. If you're quick, you can keep playing (almost) indefinitely.</p>
<p>The puzzle blocks are moved around the screen by using your finger to slide entire rows and columns. The twist is that when a block disappears off one edge of the screen, it re-appears on the opposite side, which creates kind of an infinite scrolling effect. I think that I learned a lot more about grid-based games while trying to make this feature. Sadly, it was a lot of work for a such a trivial effect!</p>
<p><a href="http://ganbarugames.com/wp-content/uploads/2011/06/game-over.png"><img src="http://ganbarugames.com/wp-content/uploads/2011/06/game-over-200x300.png" alt="" title="color + shape: game over" width="200" height="300" class="alignright size-medium wp-image-371" /></a>The goal of the game is to get a high score, and the way that is accomplished is by increasing the game's "combo" meter. Whenever you make a match, the combo meter is increased by one. Making quick sequential matches (or positioning blocks so that one match automatically triggers another) will increase that meter. The points you get for a match and the time added to your limit are multiplied by the combo meter, so you obviously want to keep it as high as possible. However, if too much time goes by without a match, the combo meter will quickly count itself back down to zero.</p>
<p>There will be two game modes, "Normal" and "Time Attack." Normal lets you play as long as you can, while Time Attack gives a set time limit within which you have to get the highest score possible (I haven't decided on the limit yet, but it'll probably be one or two minutes). Of course, there will be Game Center support, so you can compare your scores against friends and other internet crazies. </p>
<p>Right now I'm working on creating the game soundtrack. Music composition is the area of game making that I'm weakest in, but I'm going to try to get better! I have about a bazillion music-making programs; I just need to pick one, hunker down, learn it, and churn out some cool-sounding tunes. Easier said than done, of course. While my two-month deadline is rapidly approaching, I'm definitely going to have it done by the three month mark. Watch this blog or <a href="http://twitter.com/#!/ganbarugames">follow me on Twitter</a> to keep updated!</p>
