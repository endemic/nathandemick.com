#!/usr/bin/env ruby

require 'mysql2'
require 'yaml'
require 'active_support/core_ext/string'

client = Mysql2::Client.new(:host => "localhost", :username => "root", :database => 'backup')

client.query("SELECT DISTINCT * FROM posts").each do |post|
  meta = {
    'layout' => 'post',
    'status' => 'publish',
    'published' => true,
    'title' => post['title'],
    'author' => {
      'display_name' => post['author'],
      'email' => 'ndemick@gmail.com'
    },
    'date' => post['created'],
    'comments' => []
  }

  client.query("SELECT DISTINCT * FROM comments WHERE post_id = #{post['id']}").each do |comment|
    meta['comments'] << {
        'author' => comment['poster'],
        'content' => comment['contents']
      }
  end

  jekyll_entry = "#{meta.to_yaml}---\n#{post['body']}"

  File.write("_posts/#{post['created'].to_s[0 ... 10]}-#{post['title'].parameterize}.markdown", jekyll_entry)
end
