FROM ruby

RUN apt-get update -qq && apt-get install -y build-essential

# for mysql
RUN apt-get install -y mysql-client

# for nokogiri
RUN apt-get install -y libxml2-dev libxslt1-dev

# for capybara-webkit
# RUN apt-get install -y libqt4-webkit libqt4-dev xvfb

# for a JS runtime
RUN apt-get install -y nodejs

ENV APP_HOME /rails-test
RUN mkdir $APP_HOME

WORKDIR /tmp
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install

ADD . $APP_HOME
WORKDIR $APP_HOME