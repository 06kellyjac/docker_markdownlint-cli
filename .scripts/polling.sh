#!/bin/sh
set -eu

# DOCKER_HUB_TRIGGER_TOKEN must be defined to trigger Docker Hub
[ -n "$DOCKER_HUB_TRIGGER_TOKEN" ]

# CI_JOB_TOKEN must be defined to trigger GitLab
[ -n "$CI_JOB_TOKEN" ]

CONTAINER_UPDATE_FILE="docker_node_updated_datetime"
MARKDOWN_VERSION_FILE="markdown-cli_version"

GIT_CONTAINER_LAST_UPDATED=$(cat "$CONTAINER_UPDATE_FILE")
DOCKER_HUB_CONTAINER_LAST_UPDATED=$(get_docker_hub_version.sh)

GIT_MARKDOWN_VERSION=$(cat "$MARKDOWN_VERSION_FILE")
NPM_MARKDOWN_VERSION=$(npm search --parseable markdownlint-cli | cut -f5 | head -n1)


generate_commit_message() {
	TARGET_FILE="$1"
	OLD_CONTENTS="$2"
	NEW_CONTENTS="$3"
	echo "\`$TARGET_FILE\`: $OLD_CONTENTS -> $NEW_CONTENTS"
}


echo "Docker Hub Node Image update date-time: $DOCKER_HUB_LAST_UPDATED"
echo "Git Node Image update date-time: $GIT_CONTAINER_LAST_UPDATED"
echo


container_updated=false
if [ "$GIT_CONTAINER_LAST_UPDATED" = "$DOCKER_HUB_CONTAINER_LAST_UPDATED" ]; then
	echo "Already @ the latest Node Image version"
else
	echo "Not @ the latest Node Image version"
	echo "Updating $CONTAINER_UPDATE_FILE"
	echo "$DOCKER_HUB_CONTAINER_LAST_UPDATED" > "$CONTAINER_UPDATE_FILE"
	echo
	CONTAINER_MESSAGE=$(generate_commit_message "$CONTAINER_UPDATE_FILE" "$GIT_CONTAINER_LAST_UPDATED" "$DOCKER_HUB_CONTAINER_LAST_UPDATED")
	container_updated=true
	echo
fi

markdown_updated=false
if [ "$GIT_MARKDOWN_VERSION" = "$NPM_MARKDOWN_VERSION" ]; then
	echo "Already @ the latest markdownlint-cli version"
else
	echo "Not @ the latest markdownlint-cli version"
	echo "Updating $MARKDOWN_VERSION_FILE"
	echo "$NPM_MARKDOWN_VERSION" > "$MARKDOWN_VERSION_FILE"
	echo
	MARKDOWN_MESSAGE=$(generate_commit_message "$MARKDOWN_VERSION_FILE" "$GIT_MARKDOWN_VERSION" "$NPM_MARKDOWN_VERSION")
	markdown_updated=true
fi
echo

if [ "$container_updated" = true ] || [ "$markdown_updated" = true ]; then
	echo "Committing updates"
	echo
fi

if [ "$container_updated" = true ] && [ "$markdown_updated" = true ]; then
	.scripts/commit_to_gitlab.sh "$CONTAINER_MESSAGE && $MARKDOWN_MESSAGE"
elif [ "$container_updated" = true ]; then
	.scripts/commit_to_gitlab.sh "$CONTAINER_MESSAGE"
elif [ "$markdown_updated" = true ]; then
	.scripts/commit_to_gitlab.sh "$MARKDOWN_MESSAGE"
fi

echo
# Only trigger a Docker Hub rebuild if the markdownlint-cli version changes
# Docker Hub will already rebuild if the Node image on Docker Hub updates
if [ "$markdown_updated" = true ]; then
	echo "Triggering a build on Docker Hub"
	echo
	.scripts/trigger_docker_hub.sh
	echo
fi
if [ "$container_updated" = true ] || [ "$markdown_updated" = true ]; then
	echo "Triggering a build on GitLab"
	echo
	.scripts/trigger_gitlab_ci.sh
fi


