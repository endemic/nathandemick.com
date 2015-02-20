---
layout: post
status: publish
published: true
title: Back up all your MySQL databases
author:
  display_name: Nathan
  login: admin
  email: ndemick@gmail.com
  url: ''
author_login: admin
author_email: ndemick@gmail.com
wordpress_id: 907
wordpress_url: http://nathandemick.com/2009/02/back-up-all-your-mysql-databases/
date: '2009-02-16 09:35:41 -0500'
date_gmt: '2009-02-16 14:35:41 -0500'
categories:
- programming
tags: []
comments: []
---
<p>/usr/local/mysql/bin/mysqldump &#8212;all-databases -u root -p  &gt; alldatabases.sql</p>
