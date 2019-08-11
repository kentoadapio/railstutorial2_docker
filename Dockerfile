FROM ruby:2.3.1
RUN gem install bundler -v 1.16.3
RUN bundler -v

WORKDIR /tmp
ADD ./aircon_controller/Gemfile Gemfile
ADD ./aircon_controller/Gemfile.lock Gemfile.lock
RUN bundle install

# RUN mkdir -p /tmp
# WORKDIR /tmp
# RUN ls
# ADD . /tmp
# RUN ls
# RUN pwd

ENV APP_HOME /myapp
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME
# ADD ./aircon_controller/Gemfile $APP_HOME
# ADD ./aircon_controller/Gemfile.lock ${APP_HOME}
ADD ./aircon_controller ${APP_HOME}