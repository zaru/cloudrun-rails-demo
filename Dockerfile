FROM ruby:2.6.4
ENV LANG C.UTF-8

ENV RAILS_ENV=development
ENV PORT=8080
ENV RAILS_LOG_TO_STDOUT=1

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq && apt-get install -y \
    build-essential \
    nodejs \
    yarn \
 && rm -rf /var/lib/apt/lists/*

RUN gem install bundler
RUN gem install rails -v "5.2.3" --no-document

ENV APP_HOME /myapp
RUN rails new $APP_HOME
WORKDIR $APP_HOME

RUN bundle install

CMD bundle exec rails server -p ${PORT} -b 0.0.0.0