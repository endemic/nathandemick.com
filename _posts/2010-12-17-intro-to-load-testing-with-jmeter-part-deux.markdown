---
layout: post
status: publish
published: true
title: Intro to Load Testing with JMeter (part deux!)
author:
  display_name: Nathan
  login: admin
  email: ndemick@gmail.com
  url: ''
author_login: admin
author_email: ndemick@gmail.com
wordpress_id: 378
wordpress_url: http://nathandemick.com/?p=378
date: '2010-12-17 08:00:45 -0500'
date_gmt: '2010-12-17 13:00:45 -0500'
categories:
- web development
tags:
- tutorial
- web development
- java
- jmeter
- load testing
comments: []
---
<p>If you've been <a href="http://nathandemick.com/2010/12/intro-to-load-testing-with-jmeter/">following along</a>, you'll know that JMeter is most commonly used to do automated testing; you can create a bunch of virtual users to perform a set of pre-determined actions on your website. In my previous post, I detailed how to manually create a list of actions for your test users to perform. However, manually creating long lists of test actions is kind of a pain! Fortunately, JMeter includes a proxy utility that can intercept your browser requests and store them as user actions.</p>
<p>Fire up JMeter, and you'll be presented with a new plan. Create a new thread group (your users) in the Test Plan (as detailed in the previous tutorial). Now, instead of manually adding HTTP Requests for these users to perform, we'll hook up a proxy server to create the HTTP Requests for us.</p>
<p><a href="http://nathandemick.com/wp-content/uploads/2010/12/jmeter-proxy-server-config.png"><img src="http://nathandemick.com/wp-content/uploads/2010/12/jmeter-proxy-server-config-150x76.png" alt="" title="jmeter-proxy-server-config" width="150" height="76" class="alignleft size-thumbnail wp-image-383" /></a>Right-click on the WorkBench item in the sidebar, and select Add &gt; Non-Test Elements &gt; HTTP Proxy Server. You don't have to configure anything here, just click the Start button at the bottom of the config window to start the proxy server on port 8080. Now you'll have to configure your browser to pass its' requests through the proxy server. In Mac OS X, you do this system-wide by accessing your System Preferences. <a href="http://nathandemick.com/wp-content/uploads/2010/12/system-preferences-network-advanced-proxies.png"><img src="http://nathandemick.com/wp-content/uploads/2010/12/system-preferences-network-advanced-proxies-150x129.png" alt="" title="system-preferences-network-advanced-proxies" width="150" height="129" class="alignright size-thumbnail wp-image-384" /></a>Go to System Preferences &gt; Network &gt; Advanced (the "Advanced" button is in the lower-right corner of the window). When the advanced options window pops up, click the Proxies tab, then check the Web Proxy (HTTP) option, and change the Web Proxy Server port to 8080. Click OK to save your changes, then Apply to make them take effect.</p>
<p><a href="http://nathandemick.com/wp-content/uploads/2010/12/jmeter-proxy-results.png"><img src="http://nathandemick.com/wp-content/uploads/2010/12/jmeter-proxy-results-150x140.png" alt="" title="jmeter-proxy-results" width="150" height="140" class="alignleft size-thumbnail wp-image-382" /></a>Next, open your browser and go to the JMeter homepage (http://jakarta.apache.org/jmeter/). Click a few links, and then go back to your JMeter window. There should now be an arrow next to your thread group, meaning that the group contains some actions. Click the arrow to expand the list, and you should see requests for all the resources that you requested in your browser. You'll see that requests have been made for <em>every</em> resource your browser asked for, such as images and CSS files. You can remove those requests if you want, or leave them in for a more realistic simulation. </p>
<p>Don't forget to go back into your Network settings and disable the proxy server, otherwise you won't be able to make HTTP requests when you close JMeter. However, this method of creating JMeter test cases is way easier than its' manual counterpart.</p>
