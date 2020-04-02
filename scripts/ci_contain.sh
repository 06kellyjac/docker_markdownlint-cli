#!/bin/sh
set -eu

DEFAULT_BASE="alpine"

# Login
echo "${CI_REGISTRY_PASSWORD}" | docker login -u "${CI_REGISTRY_USER}" --password-stdin "${CI_REGISTRY}"

set -x
# Get the end of the job name:
# e.g.  contain:docker:latest  OR  contain:docker:0.13.0  OR  contain:docker:0.13.0-slim
#                      ^^^^^^                     ^^^^^^                     ^^^^^^^^^^^
CI_JOB_NAME_END=$(echo "${CI_JOB_NAME}" | cut -d':' -f3)

generate_image_tag () { echo "${CI_REGISTRY_IMAGE}:${CI_JOB_NAME_END}${1-}"; }

IMAGE_NAME="$(generate_image_tag)"

if echo "$CI_JOB_NAME_END" | grep "-"; then
	TARGET_DIRECTORY=$(echo "$CI_JOB_NAME_END" | awk -F'-' '{print $2"/"$1}')
else
	TAG=$(generate_image_tag "-${DEFAULT_BASE}")
	IMAGE_NAME="$IMAGE_NAME $TAG"
	TARGET_DIRECTORY="${DEFAULT_BASE}/${CI_JOB_NAME_END}"
fi

DOCKER_BUILD_LIST=$(for IMAGE in $IMAGE_NAME; do printf -- "-t %s " "$IMAGE"; done)
# shellcheck disable=SC2086
docker build $DOCKER_BUILD_LIST "$TARGET_DIRECTORY"

for IMAGE in $IMAGE_NAME; do
	docker push "$IMAGE"
done
