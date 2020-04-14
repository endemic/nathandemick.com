#!/usr/bin/env ruby

puts "What's the title of your post?"
title = gets.strip

def slugify(string)
  string.downcase.tr(' ', '-').gsub(/(?!-)\W/, '')
end

filename = "_posts/#{Time.now.to_s[0...10]}-#{slugify(title)}.markdown"

fail 'That post already exists!' if File.exists?(filename)

post_skeleton = <<-EOF
---
layout: post
status: publish
published: true
title: #{title}
author:
  display_name: Nathan
  email: ndemick@gmail.com
date: #{Time.now}
categories:
- ur
- categoriez
tags:
- ur
- tagz
comments: []
---
ur content here!
EOF

File.write(filename, post_skeleton)

puts "Created #{filename}"
