#!/bin/sh
set -eu

export COMPOSE_PARALLEL_LIMIT="${COMPOSE_PARALLEL_LIMIT:-1}"

docker compose --profile apps build
docker compose --profile apps up -d
