---
layout: post
status: publish
published: true
title: Compiling Papervision3D projects using mxmlc
author:
  display_name: Nathan
  login: admin
  email: ndemick@gmail.com
  url: ''
author_login: admin
author_email: ndemick@gmail.com
wordpress_id: 238
wordpress_url: http://www.bitter-gamer.com/?p=238
date: '2009-03-04 14:39:49 -0500'
date_gmt: '2009-03-04 19:39:49 -0500'
categories:
- programming
tags:
- Flash
- actionscript
- papervision3d
- mxmlc
comments:
- id: 124
  author: Pierre Nel
  author_email: pierre.nel@gmail.com
  author_url: http://www.pierrenel.co.uk
  date: '2009-05-12 04:00:22 -0400'
  date_gmt: '2009-05-12 09:00:22 -0400'
  content: "Wonderful! I'm actually amazed it works - I've been under the impression
    that I _really_ need to be in Windows/OSX to do cool flash stuff. Time to dust
    off the Learning Actionscript 3.0 book again :)\r\n\r\nP"
- id: 167
  author: Bence
  author_email: takacs.bence@gmail.com
  author_url: ''
  date: '2010-07-07 06:32:01 -0400'
  date_gmt: '2010-07-07 11:32:01 -0400'
  content: "I downloaded the latest Flex SDK (4.1), put it to the path, and then compile
    with the given sources:\r\n\r\nI tested with your the HelloWorld, and the examples
    on the Papervision download page (theese with swc), and everything was fine. But
    when I tried to compile the Papervision 3d plugin for Swift 3D (http://www.youtube.com/watch?v=KHCPtA78TzM),
    but I cannot run the resulted swf. This gives me a compiled one, but I would like
    to modify the sources [at least modify the path of a file], what is correct. But
    if I compile the project without any modification, the swf result do not run.
    I do not even get an error message, and do not know how could I get one.\r\n\r\nI
    get this result for every build, but it does not seem to affect anything. \r\nERmain.as:
    Warning: This compilation unit did not have a factoryClass specified in Frame
    meta\r\ndata to load the configured runtime shared libraries. To compile without
    runtime shared libraries either set the -static-link-runtime-shared-libraries
    option to true or remove the -runtime-shared-libraries option.\r\n\r\nI tried
    to run with -static-link-runtime-shared-libraries, with the same result.\r\nI
    tried with papervicion3d.swc, but with the same result (except the swf become
    2 times bigger).\r\n\r\nAny tips?"
---
<p>There's a new competition going on at TIGsource called the "<a href="http://forums.tigsource.com/index.php?topic=4823.0" title="Cockpit Compo">Cockpit Compo</a>," wherein the design constraint is using a cockpit (or similar HUD). I doubt that I will have time to actually make an entry, but since I'm using Actionscript/Flash as my language/platform of choice now-a-days, I'm trying to look into a 3D library for Actionscript. Papervision3D seems like a favorite, so my next step is to find some tutorials and give 'em a shot. First, though, we have to figure out how to actually compile projects with Papervision.</p>
<p>1. Obtain the (free) Flex SDK, and put it somewhere in your system path. I wrote a post about <a href="http://www.bitter-gamer.com/2009/02/how-to-create-flash-programs-with-actionscript-3-and-the-flex-sdk/" title="setting up your Actionscript development environment">setting up your Actionscript development environment</a>; check it out if you haven't done this already.<br />
2. Download the <a href="http://code.google.com/p/papervision3d/" title="Papervision3D compiled library (.swc) or source (.as)">Papervision3D compiled library (.swc) or source (.as)</a>. It doesn't really matter which one, as I will explain how to use 'em both.<br />
3a. If you got the .swc, put it in the same directory as your project files and rename it to 'papervision3d.swc'. When you compile, add the flag <code>-include-libraries papervision3d.swc</code>. That's it!<br />
3b. If you got the .as source, extract it and put the '/org' directory in the same directory as your project files. Compile as normal, you don't need to feed mxmlc any extra flags. </p>
<p>To test out the process, get the "Simple HelloWorld Example for Papervision3D 2.0" .zip that's on the <a href="http://code.google.com/p/papervision3d/downloads/list" title="Papervision3D downloads page">Papervision3D downloads page</a>. Drop in the .swc or the /org directory (depending on what you downloaded), then compile using the instructions above. I got the .swc, put it in a subdirectory called '/libs' within the /src, and compiled with <code>mxmlc Main.as -include-libraries libs/papervision3d.swc</code>. If everything goes the way it should, a .swf will be produced that displays a crazily-textured spinning sphere. </p>
