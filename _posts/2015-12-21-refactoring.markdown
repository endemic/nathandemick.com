---
layout: post
status: publish
published: true
title: Refactoring
author:
  display_name: Nathan
  email: ndemick@gmail.com
date: 2015-12-21 16:39:01 -0500
categories:
- programming
tags:
- code
- refactoring
- javascript
comments: []
---
When learning the code base of a new project, there are always places where
you look at what's been written, and have a "WTF" moment. Normally, it's best
to leave written code in place -- if it ain't broke, don't fix it. However,
I let myself get a bit carried away with a recent project, and rewrote the
bulk of the server-side component. I thought I'd pull out a small example of
how you can take some verbose code, and condense it down to something more
readable.

In this example, we have an array of email addresses, some of which may be
prepended with the string `"coordinator-"`. Why the original developer didn't
just create two database columns, `user_emails` and `coordinator_emails`, I
can't imagine. In any case, we want to send a message to the "non-coordinator"
email addresses.

Here was the original code:

<pre><code class="language-javascript">
var to = "";
for(var i=0; i<emails.length; i++) {
    var email = emails[i];
    if(email.indexOf('coordinator') == -1) {
        to += email;
        if(i != emails.length-1) to += ",";
    }
}
to = to.slice(0, -1);
</code></pre>

Straightforward enough, right? Create an empty string, and concatenate the
appropriate email addresses (include a separating comma), then remove the final
comma. So, if the `emails` array looks like `['bob@gmail.com', 'larry@gmail.com', 'coordinator-joe@gmail.com']`,
the final output is the string `"bob@gmail.com, larry@gmail.com"`.

But there's an easier way to do this, and it involves being knowledgeable about
common Array manipulation methods. The first thing we want to do is remove any
email addresses that contain `"coordinator-"`. Filter them out, if you will.
By Jove, there just happens to be an Array method named `filter` that we can use!
Next, we want to join the resulting email addresses together, with a comma between
them. What do you know? `join` is an Array method as well!

The whole thing boils down to one (long) line (pardon the ES6 syntax):

<pre><code class="language-javascript">
let recipients = emails.filter(email => { return email.indexOf('coordinator-') === -1; }).join(',');
</code></pre>

Which do you prefer?
