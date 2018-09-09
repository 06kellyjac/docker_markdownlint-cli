#!/bin/sh
set -euo pipefail

DEFAULT_BASE="alpine"

# Login
docker login -u ${CI_REGISTRY_USER} -p ${CI_REGISTRY_PASSWORD} ${CI_REGISTRY}

set -x

# Get the end of the job name:
# e.g.: build:docker:latest  OR  build:docker:0.13.0-slim
#                    ^^^^^^                   ^^^^^^^^^^^
CI_JOB_NAME_END=$(echo "${CI_JOB_NAME}" | cut -d':' -f3)

function generate_image_tag () {
	echo "${CI_REGISTRY_IMAGE}:${CI_JOB_NAME_END}${1-}"
}

IMAGE_NAME="$(generate_image_tag)"

if [[ ! $(echo "$CI_JOB_NAME_END" | grep "-") ]]; then
	TAG=$(generate_image_tag "-${DEFAULT_BASE}")
	IMAGE_NAME="$IMAGE_NAME $TAG"
	TARGET_DIRECTORY="${DEFAULT_BASE}/${CI_JOB_NAME_END}"
else
	TARGET_DIRECTORY=$(echo "$CI_JOB_NAME_END" | awk -F'-' '{print $2"/"$1}')
fi

DOCKER_BUILD_LIST=$(for IMAGE in $IMAGE_NAME; do printf -- "-t $IMAGE "; done)
docker build $DOCKER_BUILD_LIST $TARGET_DIRECTORY

for IMAGE in $IMAGE_NAME; do
	docker push "$IMAGE"
done
