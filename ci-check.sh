#!/bin/bash

cd /ops/config-blogsite-dev || exit 1
docker compose pull -q

NSTATIC=$(docker ps | grep ghcr.io/homercababahay/blogsite-static | wc -l)
NBACKEND=$(docker ps | grep ghcr.io/homercababahay/blogsite-backend | wc -l)

if [ x"$NSTATIC" = x1 -a x"$NBACKEND" = x1 ]; then
    exit 0
fi

docker compose down
docker compose up -d
# docker system prune -f -a
