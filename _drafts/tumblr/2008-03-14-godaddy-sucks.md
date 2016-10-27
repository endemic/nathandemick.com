---
layout: post
title: GoDaddy sucks
date: '2008-03-14T09:03:18-04:00'
tags: []
tumblr_url: http://endemic.tumblr.com/post/28842097/godaddy-sucks
---
I hate GoDaddy with a burning passion. Not only do they have a !%$@\* stupid name, but their advertising is lame and tasteless, their website sucks, they poach domain names, and their actual hosting service is some of the worst Unix-based hosting you can get. I suppose you get what you pay for, but in some cases I have to deal with their crap, because clients have bought services from them. I’ve tried to use [CakePHP](http://www.cakephp.org "CakePHP") with GoDaddy a few times, and each time makes me hate them more and more. It was the first comment in [this blog entry](http://nathan.ashleafmedia.com/2007/baking-cakephp-on-godaddy-hosting/ "this blog entry") that provided the insight. For future reference, this is what seems to work:

In the .htaccess in the main CakePHP directory root, add forward slashes to the beginning of both RewriteRules: ` `

`RewriteRule ^$ /app/webroot/ [L]RewriteRule (.*) /app/webroot/$1 [L] `

In the .htaccess in app/webroot, add a forward slash to the lone RewriteRule: ``

` RewriteRule ^(.*)$ /index.php?url=$1 [QSA,L] `

Theoretically, your CakePHP application will work now. I make no promises, though.

