FROM ruby:2.6.2
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /myapp
WORKDIR /myapp
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
RUN rails db:setup
ADD . /myapp
CMD bundle exec rails s -p 3000 -b '0.0.0.0'