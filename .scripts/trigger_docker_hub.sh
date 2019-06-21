#!/bin/sh
set -eu

# DOCKER_HUB_TRIGGER_TOKEN must be defined to trigger Docker Hub
[ -n "$DOCKER_HUB_TRIGGER_TOKEN" ]

DOCKER_TRIGGER_URL="https://registry.hub.docker.com/u/06kellyjac/markdownlint-cli/trigger/${DOCKER_HUB_TRIGGER_TOKEN}/"

RESULT=$(\
	wget \
		-qO- --header "Content-Type: application/json" \
		--post-data '{"source_type": "Branch", "source_name": "master"}' "$DOCKER_TRIGGER_URL")

if [ "$RESULT" = "OK" ]; then
	echo "Trigger sent successfully"
else
	echo "ERROR: Trigger not sent successfully"
	echo "$RESULT"
fi
