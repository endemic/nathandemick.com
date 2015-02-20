---
layout: post
status: publish
published: true
title: 'Web dev tips #2'
author:
  display_name: Nathan
  login: admin
  email: ndemick@gmail.com
  url: ''
author_login: admin
author_email: ndemick@gmail.com
wordpress_id: 62
wordpress_url: http://www.bitter-gamer.com/?p=68
date: '2007-08-31 12:01:10 -0400'
date_gmt: '2007-08-31 16:01:10 -0400'
categories:
- web development
tags: []
comments: []
---
<p>So, this probably doesn't apply to a lot of folks, but if you're trying to use tables for page layout (i.e. for HTML emails), you may notice that Firefox inserts blank space at the bottom of each image that you just can't get rid of. The cause is that the &lt;img&gt; tag has the "display: inline" property, which means that Firefox allows space for "descenders" (i.e. the parts of letters that go below the baseline; examples: jgpq). The solution in table layouts is to assign each image the "display: block" property. Alternately, you can use adjust the "vertical-align" property on the image. <a href="http://www.askthecssguy.com/2006/11/inline_images_showing_a_gap_of_1.html">Here's a page</a> with a more detailed look at the problem/solution.</p>
<p>Another thing I just wanted to mention for my own reference was short conditionals in PHP. Example:</p>
<pre>
&lt;?
	if(empty($_GET['id']))
		echo 'No ID';
	else
		echo 'ID: '.$_GET['id'];
?&gt;
</pre>
<p>Can be replaced with:</p>
<pre>
&lt;?=empty($_GET['id'])?'No ID':'ID: '.$_GET['id']?&gt;
</pre>
<p>The syntax can be broken down into CONDITIONAL ? IF TRUE : IF FALSE</p>
<p>It's basically just a way to make your code concise and look esoteric while doing so.</p>
