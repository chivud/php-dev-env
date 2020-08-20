# Simple PHP development environment with Docker and MySQL

## Prerequisites
* Linux(I haven't test this configuration on Windows, but it might work)
* Docker
* Docker-compose

## Config
The configuration can be found in `.env`
* `HOST_USER_ID`: host user id; can be found with `id -u`
* `HOST_GROUP_ID`: host group id; can be found with `id -g`

## Components:
* Apache with PHP 7.4
* MySQL 8
* [Mailcatcher](https://registry.hub.docker.com/r/schickling/mailcatcher)

## How to start
* `./dev/start.sh`
* `./dev/enter-web.sh`
* `composer create-project _PROJECT_NAME_ src`
* Access `http://localhost` on your local environment.

Note: It is important to create the app in `./src` and have the public folder at `./src/public`,
because that is how Apache vhost is configured. If you wish to change that, you need to edit `./dev/vhost/default.conf`.


