---
layout: post
status: publish
published: true
title: Goodbye ReCAPTCHA
author:
  display_name: Nathan
  email: ndemick@gmail.com
date: 2020-04-10 20:39:39 -0400
categories:
- tech
- webdev
tags:
- google
comments: []
---
So, after a very, very long time, I've decided to come back to my neglected website. A few years ago, when I was working at Nationwide Children's Hospital, I had more than enough time to spare to learn basic system administration and write blog posts. However, since coming (back) to [CoverMyMeds](https://www.covermymeds.com), I had less desire to work with computers outside of the regular 9-5. Late last year, however, I ended up switching teams, and while the new team is good, the work just isn't as satisfying as it used to be (I could probably write a whole essay on that, but we'll save it for another time). Therefore I've started itching to do "extracurricular" activities.

One of the things on my list has been to ditch ReCAPTCHA from my lame commenting system. The main reason is that, in general, I'm de-Googling. I was an early Google user (snagged my preferred username on Gmail by signing up on April 1st, 2004; remember how folks thought 1GB of storage was an April Fool's joke?), but they've transformed from the scrappy tech-nerd underdog to a giant data-sucking behemoth. I've been taking steps to preserve my online privacy by installing browser add-ons such as [uBlock Origin](https://github.com/gorhill/uBlock), which really enhances my web experience &mdash; with the unfortunate side effect that some sites break, because they expect certain JavaScript trackers to be present. This includes ReCAPTCHA. ReCAPTCHA is mostly a black box, but in general it forces users to help train Google image recognition, and in part seems to determine your "human-ness" by your activity on Google properties. I don't really want this for myself, so it also doesn't make sense for me to force it on the few folks who might stumble across this site.

Following a recommendation on Twitter led me to [hCaptcha](https://www.hcaptcha.com/). It's basically a privacy-enhancing alternative to ReCAPTCHA &mdash; it uses similar checks to prevent abuse, but is not helping Google hoover up all the datums. Of course, hCaptcha makes it pretty easy to change a few lines and start using their service. In making the change, I struggled more with updating the super old versions of the Ruby libraries running the comments app, rather than with any hCaptcha problems. I'd recommend giving it a shot!
