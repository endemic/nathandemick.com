---
layout: post
status: publish
published: true
title: Migrating to a VPS
author:
  display_name: Nathan
  email: ndemick@gmail.com
  url: 'http://nathandemick.com'
date: '2015-04-23 00:20:35 -0400'
categories:
- internets
tags:
- internets
comments: []
---
After having pretty stagnant websites costing me $10/month for years and years
on shared hosting, I'm finally in the process of migrating to a VPS hosted by
[DigitalOcean](https://www.digitalocean.com/?refcode=572fd3127dc4). I was pushed
over the edge by the fact that my shared host of 10+ years (Dreamhost) runs
Ruby 1.8.7, and I had no way to upgrade. The prospect of administering my own
web server is a bit daunting, but heck, I write websites for a living, I should
be able to figure it out.

So how does one go about moving one's digital life?

The one good thing about my shared hosting provider was that they were a
"one stop shop." I had my domain registration, email, web hosting,
version control, _everything_ in one place. Moving to a VPS means that all my
services are all over the place. Such is life, I guess. Hopefully being able
to run modern webapps for $5/month will make me feel better.

The first step for me was to migrate my old email into my Gmail account, which
I've been using for about 10 years. Fortunately, email has an "Import from POP3"
option right in __Settings -> Accounts and Import__. I grabbed all my old
messages, labeled them, and called it a day.

Next was to move all my crummy, half-baked SVN repositories over to GitHub.
Most of these are pretty worthless, but I'm a digital packrat (as well as physical),
so I followed [this tutorial from the Git Book](http://git-scm.com/book/en/v2/Git-and-Other-Systems-Migrating-to-Git).
I'll have to go back and delete most of them later, as they are of no use to
anyone, least of all myself.

I moved my domain names over to [Google Domains](https://domains.google.com).
Seems a bit sketchy since it's in the perpetual "Google Beta," but the offered
email forwarding, and the last thing I want to do is deal with an email server
to handle my legacy email address.

Lastly, I converted my Wordpress blog over to [Jekyll](http://jekyllrb.com/),
a static site generator. Conveniently enough, there's a
[Wordpress importer](http://import.jekyllrb.com/docs/wordpress/)
which I used to grab my existing posts. After installing nginx and Ruby on my shiny new
VPS, I created a [Git post-receive hook](http://jekyllrb.com/docs/deployment-methods/#git-post-receive-hook)
to rebuild the site every time I push to the remote repo.

So far it's been pretty fun to muck around with these things -- I feel like I don't
know nearly enough about system administration, so hopefully I'll pick up
a few things.
