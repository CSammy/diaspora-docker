# diaspora-docker

This image is intended exclusively for development.

## Build And Run

1. Copy `example.env` to `.env`
1. Set `EXT_UID` and `EXT_GID` in `.env` according to your user's user and group ID
1. Execute `docker-compose build diaspora` (takes some time)
1. Copy or link your diaspora code to `./diaspora.docker`
1. Execute `docker-compose up`

- To restart, do `docker-compose restart diaspora` or (faster) `docker-compose exec diaspora /bin/bash --login -c "bin/eye restart diaspora"`
- To start without migrations and bundle install, set any value for `DIASPORA_DOCKER_DEV_INSTALL_GEMS` and `DIASPORA_DOCKER_DEV_DB_MIGRATE` in `.env`. It is only executed if these variables are empty

## TODO

- Control migrations and bundle installing more intuitively
- Create external script for controlling/handling the setup
- RVM env with proper commands (`rvm gemset create 2.4@diaspora && rvm ruby-2.4@diaspora do gem install bundler`) instead of building a "skeleton" by hand (see also https://github.com/SuperTux88/diaspora-formula/blob/master/diaspora/install.sls)
