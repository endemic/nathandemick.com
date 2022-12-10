FROM ruby:3-alpine

RUN apk update
RUN apk add --no-cache \
    build-base

WORKDIR /app

COPY Gemfile Gemfile.lock /app/

RUN bundle

EXPOSE 4000

CMD ["jekyll", "serve", "--host", "0.0.0.0", "--livereload"]
