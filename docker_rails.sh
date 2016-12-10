#!/bin/sh

rails_version="${RAILS_VERSION:-latest}"
ruby_version="${RUBY_VERSION:-2.3}"

docker run --rm -v `pwd`:/usr/src/app rails:$rails_version rails new /usr/src/app --database mysql --git --force

cat << __EOT__ > Dockerfile
FROM ruby:$ruby_version
ENV LANG C.UTF-8

RUN apt-get update && \\
    apt-get install -y nodejs mysql-client --no-install-recommends && \\
    rm -rf /var/lib/apt/lists/* && \\
    mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/
RUN bundle install

COPY . /usr/src/app

EXPOSE 3000
CMD ["./bin/rails", "server", "-b", "0.0.0.0"]
__EOT__

cat << __EOT__ > docker-compose.yml
rails:
  build: .
  command:
    [ "bash", "-c", "rm -f tmp/pids/server.pid; ./bin/rails server -b 0.0.0.0" ]
  mem_limit: 384m
  environment:
    DISABLE_SPRING: "1"
  ports:
    - "3000:3000"
  volumes:
    - ".:/usr/src/app"
  links:
    - "mysql"

mysql:
  image: mysql:5.6
  environment:
    MYSQL_ROOT_PASSWORD: "passwd"
__EOT__

sed -i "" -e  's/password:$/password: "passwd"/;s/localhost/mysql/' config/database.yml
sed -i "" -e  "s|^end|  config.web_console.whitelisted_ips = %w( 0.0.0.0/0 ::/0 )"\\$'\n'"end|" config/environments/development.rb
touch Gemfile.lock
docker-compose build
docker-compose run rails bundle install

docker-compose up -d
sleep 60
docker-compose run rails ./bin/rake db:create
sleep 10
docker-compose run rails ./bin/rake db:create RAILS_ENV=test
sleep 10
docker-compose stop

