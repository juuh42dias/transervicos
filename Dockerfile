FROM ruby:2.6.2
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /transervicos
WORKDIR /transervicos
RUN gem install bundler:2.0.1
COPY Gemfile /transervicos/Gemfile
COPY Gemfile.lock /transervicos/Gemfile.lock
RUN bundle install
COPY . /transervicos

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
