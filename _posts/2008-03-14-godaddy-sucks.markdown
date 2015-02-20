---
layout: post
status: publish
published: true
title: GoDaddy sucks
author:
  display_name: Nathan
  login: admin
  email: ndemick@gmail.com
  url: ''
author_login: admin
author_email: ndemick@gmail.com
wordpress_id: 1189
wordpress_url: http://nathandemick.com/2008/03/godaddy-sucks/
date: '2008-03-14 09:03:18 -0400'
date_gmt: '2008-03-14 13:03:18 -0400'
categories:
- programming
tags: []
comments: []
---
<p>I hate GoDaddy with a burning passion. Not only do they have a&#160;!%$@* stupid name, but their advertising is lame and tasteless, their website sucks, they poach domain names, and their actual hosting service is some of the worst Unix-based hosting you can get. I suppose you get what you pay for, but in some cases  				I have to deal with their crap, because clients have bought services from them. I&#8217;ve tried to use <a href="http://www.cakephp.org" title="CakePHP">CakePHP</a> with GoDaddy a few times, and each time makes me hate them more and more. It was the first comment in <a href="http://nathan.ashleafmedia.com/2007/baking-cakephp-on-godaddy-hosting/" title="this blog entry">this blog entry</a> that provided the insight.  				For future reference, this is what seems to work:</p>
<p>In the .htaccess in the main CakePHP directory root, add forward slashes to the beginning of both RewriteRules: 					<code> 					   </code></p>
<p><code>RewriteRule    ^$ /app/webroot/    [L]<br />RewriteRule    (.*) /app/webroot/$1 [L] 					</code> 				</p>
<p>In the .htaccess in app/webroot, add a forward slash to the lone RewriteRule: 					<code></code></p>
<p><code> 						RewriteRule ^(.*)$ /index.php?url=$1 [QSA,L] 					</code> 				</p>
<p>Theoretically, your CakePHP application will work now. I make no promises, though.</p>
