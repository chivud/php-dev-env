#!/usr/bin/env bash

set -eu

cd "$( dirname "${BASH_SOURCE[0]}" )" && cd ..

docker-compose down
