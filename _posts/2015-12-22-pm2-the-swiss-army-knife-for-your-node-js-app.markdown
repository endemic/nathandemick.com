---
layout: post
status: publish
published: true
title: PM2&#58; The Swiss Army knife for your Node.js app
author:
  display_name: Nathan
  email: ndemick@gmail.com
date: 2015-12-22 12:00:00 -0500
categories:
- technology
tags:
- node.js
- sysadmin
- pm2
comments: []
---
I recently discovered PM2. It is great. Tell your friends. I can't believe that
one app does so many (necessary) things:

### [(Re)starts your app](http://pm2.keymetrics.io/docs/usage/process-management/)

A naive approach to running a Node application would be to start the process and
put it in the background. But what happens when it (inevitably) crashes? Give
PM2 your application configuration, and it will start the app and ensure it
respawns after a crash.

### [Monitor memory/CPU usage](http://pm2.keymetrics.io/docs/usage/monitoring/)

App got a memory leak? Churning CPU? Watch your usage levels in real time.

### [Run app in fork/cluster mode](http://pm2.keymetrics.io/docs/usage/cluster-mode/)

Normally you'd have to write your app specifically to take advantage of [clustering](https://nodejs.org/docs/latest/api/cluster.html),
but with PM2, you can just specify whether you want a single process or multiple processes. By default, it'll spin up as many
workers as your CPU has cores.

### [Log output from stdin/stderr](http://pm2.keymetrics.io/docs/usage/log-management/)

While there are a number of sophisticated logging solutions for Node, at this point
in my usage of it I really only care about getting `console.log` statements and
stack traces written out to external files. By default, Node outputs these messages
to stdout/stderr, which PM2 will watch and write off to log files. You can easily
get a stream of logs using `pm2 logs`, or limit to one application using `pm2 logs <appname>`.

### [Easily set up log rotation](http://pm2.keymetrics.io/docs/usage/log-management/#setting-up-a-native-logrotate)

As with any web application that generates log files, after a while the files get too large and
unwieldy. PM2 has a command that will automatically generate a `logrotate` config
file that targets the default PM2 log location.

### [Auto-restart app during development](http://pm2.keymetrics.io/docs/usage/watch-and-restart/)

When developing, you have to restart your Node server in order to see changes.
Frameworks like Rails have a "development" mode they can use to re-load code
before each request, but with Node you'll probably rely on something like `supervisor`,
which watches the filesystem of your project for changes, then kills/respawns
your Node process. Or you can just use PM2, which does the same thing.

### [Start app after server reboot](http://pm2.keymetrics.io/docs/usage/startup/)

This is a necessary evil that I'd wager many developers don't think about,
similar to log rotation. Unless you create a custom init script, if your server
ever reboots, you will have to log in and restart the PM2 daemon. PM2 can generate
a startup script for you!

### [Deployment](http://pm2.keymetrics.io/docs/usage/deployment/)

I haven't used this aspect of PM2, but am hoping to soon. Instead of manually
SSH'ing to your server in order to do deploys, just use the functionality
built in to PM2, which will check out code from your VCS and (re)start the Node
process. It supports multiple server targets, as well as rollbacks.
