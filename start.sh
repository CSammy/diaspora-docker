#!/bin/bash --login

action_install_gems() {
  script/configure_bundler
  bin/bundle config --local path vendor/bundle
  bin/bundle install --full-index
}

action_db_migrate() {
  bin/rake db:create db:migrate
}

[ -z $DIASPORA_DOCKER_DEV_INSTALL_GEMS ] && action_install_gems

[ -z $DIASPORA_DOCKER_DEV_DB_MIGRATE ] && action_db_migrate

[ ! -f public/source.tar.gz ] && touch public/source.tar.gz

exec ./script/server
