#!/bin/sh
set -eu

# DOCKER_HUB_TRIGGER_TOKEN must be defined for `trigger_docker_hub.sh`
[ -n "$DOCKER_HUB_TRIGGER_TOKEN" ]

UPDATE_FILE="docker_node_updated_datetime"

DOCKER_API_URL="https://hub.docker.com/v2/repositories/library/node/"

DATE_TIME_REGEX='"last_updated": "[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}.[0-9]{6}Z"'

GIT_LAST_UPDATED=$(cat "$UPDATE_FILE")
DOCKER_HUB_LAST_UPDATED=$(wget -qO- $DOCKER_API_URL | grep -oE "$DATE_TIME_REGEX" | cut -d'"' -f4)

echo "Docker Hub Node Image update date-time: $DOCKER_HUB_LAST_UPDATED"
echo "Git Node Image update date-time: $GIT_LAST_UPDATED"
echo
if [ "$GIT_LAST_UPDATED" = "$DOCKER_HUB_LAST_UPDATED" ]; then
	echo "Already @ the latest Node Image version"
else
	echo "Not @ the latest version"
	echo "Committing updates"
	echo
	.scripts/commit_to_gitlab.sh "$UPDATE_FILE" "$GIT_LAST_UPDATED" "$DOCKER_HUB_LAST_UPDATED"
	echo
	# Only need to trigger GitLab as Docker Hub supports watching images for updates out of the box.
	echo "Triggering a build on GitLab"
	echo
	.scripts/trigger_gitlab_ci.sh
fi
