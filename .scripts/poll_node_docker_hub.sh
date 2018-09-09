#!/bin/sh
set -eu
UPDATE_FILE="UPDATED"

DOCKER_API_URL="https://hub.docker.com/v2/repositories/library/node/"

DATE_TIME_REGEX='"last_updated": "[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}.[0-9]{6}Z"'

GIT_LAST_UPDATED=$(cat "$UPDATE_FILE")
DOCKER_HUB_LAST_UPDATED=$(wget -qO- $DOCKER_API_URL | grep -oE "$DATE_TIME_REGEX" | cut -d'"' -f4)

echo "Docker Hub Node Image update date-time: $DOCKER_HUB_LAST_UPDATED"
echo "Git Node Image update date-time: $GIT_LAST_UPDATED"
echo

if [ "$GIT_LAST_UPDATED" != "$DOCKER_HUB_LAST_UPDATED" ]; then
	echo "Not @ the latest version"
	echo
	echo "Triggering a build on GitLab"
	echo
	.scripts/trigger_gitlab_ci.sh
	echo
	.scripts/update_gitlab.sh "$UPDATE_FILE" "$GIT_LAST_UPDATED" "$DOCKER_HUB_LAST_UPDATED"
else
	echo "Already @ the latest Node Image version"
fi
