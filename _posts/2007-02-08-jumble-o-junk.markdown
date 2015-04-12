---
layout: post
status: publish
published: true
title: Jumble 'o Junk
author:
  display_name: Nathan
  email: ndemick@gmail.com
date: 2007-02-08 12:34:39.000000000 -05:00
comments: []
---
First off, I've finished Castlevania: Portrait of Ruin. It's rubbish. I have the makings of a writeup on my computer somewhere, and now I just need to be bothered to finish it.<br /><br />
Next, an <a href="http://blog53.fc2.com/k/king75/file/owata.html">annoying flash game, Jinseiowata no daibouken</a>. The title could be said to translate to "Life-over super-adventure." I didn't even make it past the first screen. 
<br /><br />
Uhh, I was going to put some other stuff here too. Ah, yes, OpenGL's polygon offset feature. In many "programmer designed" games (i.e. <a href="http://www.asahi-net.or.jp/~cs8k-cyu/index_e.html">stuff by Kenta Cho</a>) polygon models are outlined to provide greater contrast. A simple way of doing this is drawing a filled poly, then drawing the same polygon as a wireframe over top. The problem with this, however, is that the wireframe will sometimes move in and out of the poly, resulting in "<a href="img/poly-offset-off.png">stitching</a>."  Notice how the lines around the back edges of the cube are kinda spotty? Yeah, we don't want that. So, by invoking a polygon offset, we can slightly reduce the size of the red cube, which means the <a href="img/poly-offset-on.png">wireframe is always on top</a>. Slight difference, but it's definitely noticeable. I hacked up <a href="http://www.zeuscmd.com/tutorials/opengl/15-PolygonOffset.php">this tutorial</a> to produce the above images.