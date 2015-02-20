---
layout: post
status: publish
published: true
title: Modifying dateTimeOptionTag() in CakePHP
author:
  display_name: Nathan
  login: admin
  email: ndemick@gmail.com
  url: ''
author_login: admin
author_email: ndemick@gmail.com
wordpress_id: 52
wordpress_url: http://www.bitter-gamer.com/?p=50
date: '2007-07-26 10:03:55 -0400'
date_gmt: '2007-07-26 14:03:55 -0400'
categories:
- web development
tags: []
comments: []
---
<p>CakePHP has all sorts of nifty form helpers that I would ordinarily never use, except for the fact that they get put in the auto-generated views. The helper that creates a day/month/year select tag automatically lists years from like 1947-2017... way too many. I normally don't care, but a client complained about it this morning, so I had to go searching around for a way to fix it. Rather than go into the code itself, I prefer to be lazy and just search the net to see if anyone else has written something about it. Jackpot! Some dude has written how to <a href="http://szellemszar.blog.hu/2007/02/01/custom_starting_year_for_date_time_selec" title="Modifying dateTimeOptionTag() in CakePHP">modify the dateTimeOptionTag()</a>. </p>
<p>In case that page goes blank, the gist is editing<br />
<code>/cake/libs/view/helpers/html.php</code>, which is the HTML Helper. Find the calls to yearOptionTag(), and change the third and fourth parameters to your start and end year, respectively. I used <code>date("Y")</code> and <code>date("Y", strtotime("+4 years"))</code>.</p>
<p><strong>[Edit]</strong> Alternately, just modify yearOptionTag() itself... the place to change the code is pretty obvious.</p>
