#!/bin/sh
set -eu

DOCKER_CONTAINER_API_URL="https://hub.docker.com/v2/repositories/library/node/"

DATE_TIME_REGEX='"last_updated": "[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}.[0-9]{6}Z"'

wget -qO- "$DOCKER_CONTAINER_API_URL" | grep -oE "$DATE_TIME_REGEX" | cut -d'"' -f4 | head -n1
