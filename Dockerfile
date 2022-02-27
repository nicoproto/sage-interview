FROM ruby:3.1.0
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

WORKDIR /app
COPY . /app/

ENV BUNDLE_PATH /gems
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y yarn
RUN yarn install
RUN bundle install

ENTRYPOINT ["bin/rails"]
CMD ["s", "-b", "0.0.0.0"]

EXPOSE 3000