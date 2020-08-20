#!/usr/bin/env bash

set -eu

docker exec -it -u "$(id -u):$(id -g)" webserver bash

