FROM ruby:latest

WORKDIR /app

COPY Gemfile Gemfile.lock /app/

RUN bundle

EXPOSE 4000

CMD ["jekyll", "serve", "--host", "0.0.0.0", "--livereload"]
