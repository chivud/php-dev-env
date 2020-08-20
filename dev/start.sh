#!/usr/bin/env bash

set -eu

cd "$( dirname "${BASH_SOURCE[0]}" )" && cd ..

./dev/stop.sh

mkdir -p ./src

docker-compose up -d --build
