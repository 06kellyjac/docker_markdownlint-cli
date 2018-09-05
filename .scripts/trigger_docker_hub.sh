#!/bin/sh
set -e
# DOCKER_HUB_TRIGGER_TOKEN must be defined
[ ! -z $DOCKER_HUB_TRIGGER_TOKEN ]

VERSION_FILE="./VERSION"
POST_URL="https://registry.hub.docker.com/u/06kellyjac/markdownlint-cli/trigger/${DOCKER_HUB_TRIGGER_TOKEN}/"

GIT_VERSION=$(cat "$VERSION_FILE")
NPM_VERSION=$(npm search --parseable markdownlint-cli | cut -f5)

echo "NPM Version: $NPM_VERSION"
echo "GIT Version: $GIT_VERSION"
echo ""

if [ "$GIT_VERSION" != "$NPM_VERSION" ]; then
	echo "Not @ the latest version"
	echo "Triggering a build on Docker Hub"
	# RESULT=$(wget \
	# 	-qO- \
	# 	--header "Content-Type: application/json" \
	# 	--post-data '{"build": true}' \
	# 	$POST_URL)
	# [ "$RESULT" = "OK" ] && echo "Trigger sent successfully" || ( echo "ERROR: Trigger not sent successfully" && echo "$RESULT" )
	echo "Preparing git"
	apk add --update openssh-client
	eval $(ssh-agent -s)
	echo "$SSH_KEY" | tr -d '\r' | ssh-add - > /dev/null
	mkdir -p ~/.ssh && chmod 700 ~/.ssh
	ssh-keyscan gitlab.com >> ~/.ssh/known_hosts && chmod 644 ~/.ssh/known_hosts
	apk add --update git
	git status
	echo "Committing the change"
	# git commit -am "$CI"
	echo "Pushing the change"
	# git push
else
	echo "Already @ the latest version"
fi
