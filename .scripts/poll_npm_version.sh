#!/bin/sh
set -eu

# DOCKER_HUB_TRIGGER_TOKEN must be defined for `trigger_docker_hub.sh`
[ ! -z $DOCKER_HUB_TRIGGER_TOKEN ]

VERSION_FILE="VERSION"

GIT_VERSION=$(cat "$VERSION_FILE")
NPM_VERSION=$(npm search --parseable markdownlint-cli | cut -f5)

echo "NPM Version: $NPM_VERSION"
echo "GIT Version: $GIT_VERSION"
echo

if [ "$GIT_VERSION" != "$NPM_VERSION" ]; then
	echo "Not @ the latest version"
	echo "Committing updates"
	echo
	.scripts/commit_to_gitlab.sh "$VERSION_FILE" "$GIT_VERSION" "$NPM_VERSION"
	echo
	echo "Triggering a build on GitLab"
	echo
	.scripts/trigger_gitlab_ci.sh
	echo
	echo "Triggering a build on Docker Hub"
	echo
	.scripts/trigger_docker.sh
else
	echo "Already @ the latest version"
fi
