---
layout: post
status: publish
published: true
title: Roll back multiple migrations with Capistrano
author:
  display_name: Nathan
  email: ndemick@gmail.com
date: 2015-04-30 16:11:44 -0400
categories:
- programming
tags:
- ruby
- rails
- capistrano
- migrations
comments: []
---
Have you ever used Capistrano to run Rails' database migrations in your
production environment? It's pretty great, just `cap deploy:migrations` and
you're good to go. You've probably also had to use Capistrano to roll back a
bad deploy, using `cap deploy:rollback`. But what if your most recent
deployment had a migration that introduced a schema incompatible with your old
code?

Well, if there was only one migration, you could roll it back by using
`rake db:rollback RAILS_ENV=production`. However, the problem I found
myself in a few months ago was that I had deployed a feature with multiple
migrations. _And_, it was a long running branch, so the migration files weren't
the most recent ones run. `rake db:rollback` would have, in fact, reverted
only a single (and wrong!) schema change.

The correct command to use in these cases is `rake db:migrate:down
RAILS_ENV=production VERSION=<UR TIMESTAMP HERE>`. Let's be honest, though.
If you're rolling back a schema change, you don't want to mess around with
running these tasks one at a time. In my situation, I had 10 (!) migrations
that needed to be reverted. I ended up rolling them back on at a time, until
one halfway through threw an error. I then realized that the only way out was
through, and fixed the bug that caused the rollback attempt.

So! Resolving to never be in that situation again, I created a simple Capistrano
(ver. 2) task to revert multiple migrations. And I always ensure that all
migrations in any pull request I merge can be run both ways. 

<pre><code class="language-ruby">
desc 'Migrate downwards; Usage: cap db:migrate:down VERSIONS=TIMESTAMP,[...],TIMESTAMP'
namespace :db do
  namespace :migrate do
    task :down, roles: :db do
      ENV['VERSIONS'].split(',').each do |version|
        run "cd #{current_path} && bundle exec rake db:migrate:down VERSION=#{version}"
      end
    end
  end
end
</code></pre>
