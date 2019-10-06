FROM ruby:2.6.4
ENV BUNDLE_PATH="$GEM_HOME" HISTFILE="$APP_HOME/tmp/docker_histfile"

RUN apt-get update -qq \
  && apt-get install -y --no-install-recommends nodejs postgresql-client cmake npm \
  && npm install -g yarn

RUN mkdir /transervicos
WORKDIR /transervicos
RUN gem install bundler:2.0.1
COPY Gemfile /transervicos/Gemfile
COPY Gemfile.lock /transervicos/Gemfile.lock
COPY . /transervicos

# Install gems using Bundler
RUN bundle check || (bundle install --no-cache --jobs=2 \
      && bundle clean --force \
      && rm -rf "$BUNDLE_PATH/gems/*/.git" \
      && rm -rf "$BUNDLE_PATH/bundler/gems/*/.git")

# Install JS packages using Yarn
COPY package.json yarn.lock /transervicos/
RUN yarn install && yarn cache clean

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
