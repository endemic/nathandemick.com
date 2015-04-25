---
layout: post
status: publish
published: true
title: Adding files to Subversion with ‘@’ in the filename
author:
  display_name: nathan
  login: nathan
  email: ndemick@gmail.com
  url: ''
author_login: nathan
author_email: ndemick@gmail.com
wordpress_id: 16
wordpress_url: http://ganbarugames.com/?p=16
date: '2010-11-22 14:13:23 -0500'
date_gmt: '2010-11-22 19:13:23 -0500'
categories:
- Programming
tags:
- programming
- iOS
- subversion
comments: []
---
<p>Weird that this little issue doesn't show more results in Google. Apple's file naming convention for supporting 2x rez images for Retina Display support is to add "@2x" at the end of a file name, before the extension. All well and good, except that if you're using Subversion for version control, it borks when you try to add files with a '@' in the name. Solution? Add an additional '@' at the end of your line. So instead of<br><br><br />
<code>svn add Resources/Icon@2x.png</code><br><br>you enter<br><br><code>svn add Resources/Icon@2x.png@</code><br><br>Done and done! (<a href="http://www.jroller.com/evans/entry/adding_files_with_in_file" title="Adding files with '@' in file name">Source</a>)</p>
