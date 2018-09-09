#!/bin/sh
set -eux

DEFAULT_BASE="alpine"

# Login
echo docker login -u ${CI_REGISTRY_USER} -p ${CI_REGISTRY_PASSWORD} ${CI_REGISTRY}

# Get the end of the job name:
# e.g.: build:docker:latest  OR  build:docker:0.13.0-slim
#                    ^^^^^^                   ^^^^^^^^^^^
CI_JOB_NAME_END=$(cut -d':' -f3 <<< "${CI_JOB_NAME}")

function generate_image_tag () {
	set +u
	echo "${CI_REGISTRY_IMAGE}:${CI_JOB_NAME_END}${1}"
}

IMAGE_NAME=("$(generate_image_tag)")

if [[ "$CI_JOB_NAME_END" != *"-"* ]]; then
	TAG=$(generate_image_tag "-${DEFAULT_BASE}")
	IMAGE_NAME=("${IMAGE_NAME[@]}", "$TAG")
	TARGET_DIRECTORY="${DEFAULT_BASE}/${CI_JOB_NAME_END}"
else
	TARGET_DIRECTORY=$(awk -F'-' '{print $2"/"$1}' <<< "$CI_JOB_NAME_END")
fi

DOCKER_BUILD_LIST=$(sed 's/, / -t /g' <<< "-t ${IMAGE_NAME[@]}")
docker build $DOCKER_BUILD_LIST $TARGET_DIRECTORY

DOCKER_PUSH_LIST=$(sed 's/, / \&\& docker push /g' <<< "${IMAGE_NAME[@]}")
docker push $DOCKER_PUSH_LIST
