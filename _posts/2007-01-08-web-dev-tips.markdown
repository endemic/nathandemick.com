---
layout: post
status: publish
published: true
title: Web dev tips
author:
  display_name: Nathan
  email: ndemick@gmail.com
date: 2007-01-08 09:28:33.000000000 -05:00
comments: []
---
For a while, whenever I've come across a weird web problem, then find a solution, I've had this desire to post about it here. Even though no one who reads this would care about web stuff in the slightest. Anyway, I don't care!
<br /><br />
On one of my sites, IE was returning blank pages whenever links were clicked on. Refreshing the page would result in the correct page being displayed... it was bizarre. I figured that  the problem had to be something PHP- or session-related, but it turned out that the page content/type wasn't being defined the way IE likes it. I found <a href="http://forums.devnetwork.net/viewtopic.php?p=328492&sid=7f4a969aeb91074a1082da477d1ecd6a">this forum post</a> that tells of another guy having the same problem, and his solution. Word up! Just define the character set by using this header command: 
<div class="code" style="padding: 7px; margin: 5px; border: 1px solid #eec; background: #ffd">
header("Content-Type: text/html; charset=UTF-8");
</div>
It works now; lame problem, fast enough solution.