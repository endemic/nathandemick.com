---
layout: post
status: publish
published: true
title: Build a minimal Docker image for Rails
author:
  display_name: Nathan
  email: ndemick@gmail.com
date: 2021-09-02 21:26:53 -0400
categories:
- howto
- webdev
tags:
- rails
- docker
comments: []
---

* Base your Docker image off `ruby:3-alpine`, and add a few packages: `build-base` to compile native extensions,
`nodejs` for a JS runtime, `yarn` for JS dependency management (both required for Webpack), and `sqlite-dev` for
SQLite (the default database used in a new Rails installation).

```Dockerfile
FROM ruby:3-alpine

RUN apk update
RUN apk add --no-cache \
    build-base \
    nodejs \
    yarn \
    sqlite-dev

WORKDIR /app
```

* Build the image: `docker build . --tag minimal_rails_image`

* Get in, loser! `docker run --rm --interactive --tty --volume $(pwd):/app minimal_rails_image sh`

* Install the rails gem: `gem install rails`

* Bootstrap a new Rails application: `rails new .`

* Add tzinfo (Alpine doesn't have it, apparently); remove the `platforms:` arg from the `gem 'tzinfo-data'` line.
I also had to remove the reference for it in the lockfile, before running `bundle install` again

* Generate webpacker config: `rails webpacker:install`

* Grow old and die waiting for the horrific nightmare that is modern front-end

* Modify the Dockerfile to be able to re-build the image and run Rails in dev mode:

```Dockerfile
COPY Gemfile Gemfile.lock /app/

RUN bundle install

EXPOSE 3000

CMD ["rails", "server", "--binding=0.0.0.0"]
```

* Re-build the image: `docker build . --tag minimal_rails_image`

* Run it (detached): `docker run --rm --detach --name rails_container --volume $(pwd):/app --publish 3000:3000 minimal_rails_image`.
You should now be able to hit `localhost:3000` in your browser and see the "Welcome to Rails" splash page.

* Rails console in running container: `docker exec --interactive --tty rails_container rails c`

* Tail logs: `docker logs --follow rails_container`

* Shell prompt: `docker exec --interactive --tty rails_container sh`
