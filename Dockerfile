FROM ruby:3.3.7-alpine3.21

WORKDIR /app

RUN apk add build-base

ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock

RUN bundle install

COPY . /app

CMD ["ruby", "app/main.rb"]
