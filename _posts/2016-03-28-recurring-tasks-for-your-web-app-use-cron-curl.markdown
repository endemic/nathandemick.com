---
layout: post
status: publish
published: true
title: Recurring tasks for your web app? Use cron + curl.
author:
  display_name: Nathan
  email: ndemick@gmail.com
date: 2016-03-28 14:05:03 -0400
categories:
- programming
tags:
- cron
- curl
- nerdery
- linux
comments: []
---
Work on a web app long enough, and you'll come across some sort of task that needs
to be accomplished by your app at regular intervals. Some examples might include
pruning inactive user accounts, sending reminder emails, or running custom analytics.

My first introduction to these sorts of tasks was at a previous job. A Rails
app needed to run a task at regular intervals, and used a gem called [Clockwork](https://rubygems.org/gems/clockwork).
At first glance, this seems to be a decent solution to the problem -- a lightweight
Ruby daemon which triggers your code at regular intervals, using a nice DSL.
However, after using it for a while, I decided it perhaps wasn't the perfect tool.
First of all, it adds a dependency to your app, and you need to take the time to
learn the API and how to use it. You also need to monitor the Clockwork process
to ensure that it doesn't crash. You _also_ need to ensure that the Clockwork
process runs on a single app server. Plus, it turns out that [timezones are hard](https://github.com/tomykaira/clockwork/issues/92).

When a recent requirement came up that could be solved by a periodic task, I ruled
Clockwork out, and decided to use some other common tools to accomplish the same goal.
As you may have surmised, I ended up using `cron` to invoke `curl`, and hit a
private URL in my app. While I'm sure many folks can point out downsides to such
an approach, it has a lot of appeal to me:

1. Uses very basic software that ships with most (all?) Linux systems, which is
   well understood.
2. Hits your webapp, so dealing with setting up a DB connection pool, logging, etc.
   for your task is already done.

Cron syntax inscrutable to you? A [quick Google search](http://lmgtfy.com/?q=cron+checker)
should clear it up nicely. Don't want to expose a sensitive or resource-intensive
task via a public URL? Use basic auth to secure it, returning a 404 if the auth
is missing. As a bonus, `cron` will use the system time, so you don't have to worry
about your scheduled job missing a beat during DST.
