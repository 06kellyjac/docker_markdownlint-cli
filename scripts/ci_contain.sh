#!/bin/sh
set -eu

DEFAULT_BASE="alpine"

# Login
echo "${CI_REGISTRY_PASSWORD}" | docker login -u "${CI_REGISTRY_USER}" --password-stdin "${CI_REGISTRY}"

# Get the end of the job name:
# e.g.  contain:docker:latest  OR  contain:docker:0.13.0  OR  contain:docker:0.13.0-slim
#                      ^^^^^^                     ^^^^^^                     ^^^^^^^^^^^
CI_JOB_NAME_END=$(echo "${CI_JOB_NAME}" | cut -d':' -f3)

generate_image_tag () { echo "${CI_REGISTRY_IMAGE}:${CI_JOB_NAME_END}${1-}"; }

IMAGE_NAME="$(generate_image_tag)"
TMP_CONTEXT="$(mktemp -p/tmp -d context-XXXXXXXX)"

if echo "$CI_JOB_NAME_END" | grep -q "-"; then
	TARGET=$(echo "$CI_JOB_NAME_END" | awk -v ctx="$TMP_CONTEXT" -F'-' '{print "-f "$2"/Dockerfile."$1" "ctx}')
else
	TAG=$(generate_image_tag "-${DEFAULT_BASE}")
	IMAGE_NAME="$IMAGE_NAME $TAG"
	TARGET="-f ${DEFAULT_BASE}/Dockerfile.${CI_JOB_NAME_END} $TMP_CONTEXT"
fi

DOCKER_BUILD_LIST=$(for IMAGE in $IMAGE_NAME; do printf -- "-t %s " "$IMAGE"; done)
# shellcheck disable=SC2086
docker build $DOCKER_BUILD_LIST $TARGET

for IMAGE in $IMAGE_NAME; do
	docker push "$IMAGE"
done
