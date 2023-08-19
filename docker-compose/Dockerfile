FROM ruby:3.2.1

WORKDIR /app
COPY . /app

RUN apt-get update

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs
RUN npm cache verify
RUN npm install webpack -g

RUN gem install bundler -v 2.4.7
RUN git config --global http.sslverify false
RUN gem update --system 3.4.9
RUN bundle install --jobs 5 --retry 5

#instalando yarn
RUN npm install yarn --global

# Instalando o Webpacker
RUN bundle exec rails webpacker:install
RUN mkdir -p tmp/pids && chmod 0777 tmp/pids

CMD exec docker-compose/start.sh