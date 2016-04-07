---
layout: post
status: publish
published: true
title: Bare-bones SSH Tunneling
author:
  display_name: Nathan
  email: ndemick@gmail.com
date: 2015-12-28 15:45:09 -0500
categories:
- Tutorial
tags:
- SSL
- VPN
comments: []
---
This year, I wanted to work remotely for a day or two in the week leading up
to Christmas. I went through the trouble of getting an RSA dongle and setting
up the terrible VPN software on my machine, only to discover that I couldn't
access some resources that were within my company's [DMZ](https://en.wikipedia.org/wiki/DMZ_(computing)).
When I asked about this, the "official" response was that it was expected for
users to connect to an intermediary machine first, _then_ connect to the desired
(restricted access) resource. Whiskey Tango Foxtrot! The problem here is that
I don't have an intermediary machine.

This situation can be (mostly) solved by using SSH tunneling, which can take
network traffic directed at a local port, and send it to a remote port via
a man-in-the-middle server. In my case, I have access to an internal-only
webserver, which itself has access to the DMZ. The two tasks that I needed
to do on restricted server were HTTPS access (port 443) and SFTP access (port
22).

### HTTPS

<pre><code class="language-javascript">
ssh -L 3000:&lt;inaccessible_server>:443 &lt;your_username>@&lt;accessible_server> -N
</code></pre>

The `-L` option means we want to do local port forwarding, and `-N` specifies
that no command should be executed on the remote server. You could also add
`-f` if you want to put the `ssh` process in the background.
Run this command, and load `localhost:3000` in your browser. Unfortunately, you'll
see a "certificate mismatch" error message, because the SSL certificate doesn't
match the URL. A hacky way to fix this is to modify your `/etc/hosts` file, and
add an alias (on a new line):

<pre><code class="language-javascript">
127.0.0.1 &lt;inaccessible_server_url>
</code></pre>

Then you can hit `<inaccessible_server_url>` as (almost) normal, the only difference
being that you have to specify port 3000 instead of the normal HTTPS port 443.

### SFTP

Basically do the same thing as with the HTTPS setup, except change the remote
port to be 22:

<pre><code class="language-javascript">
ssh -L 3000:&lt;inaccessible_server>:22 &lt;your_username>@&lt;accessible_server> -N
</code></pre>

Add your hosts alias, then modify your SFTP connection to hit port 3000, and
connect as normal.

(Note that adding the DNS alias only matters if you're accessing the server via
URL; if you're connecting via IP, you'll have to change the server to `localhost`.)

### References

* [SSH Tunneling Made Easy](http://www.revsys.com/writings/quicktips/ssh-tunnel.html)
* [SSH Tunnel - Local and Remote Port Forwarding Explained With Examples](http://blog.trackets.com/2014/05/17/ssh-tunnel-local-and-remote-port-forwarding-explained-with-examples.html)
