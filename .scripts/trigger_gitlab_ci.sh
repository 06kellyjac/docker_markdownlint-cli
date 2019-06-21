#!/bin/sh
set -eu

# GITLAB_TRIGGER_URL and CI_JOB_TOKEN must be defined to trigger GitLab
[ -n "$GITLAB_TRIGGER_URL" ]
[ -n "$CI_JOB_TOKEN" ]

GITLAB_TRIGGER_URL="https://gitlab.com/api/v4/projects/8206202/trigger/pipeline"
RESULT=$(wget -qO- --post-data "ref=master&token=$CI_JOB_TOKEN" "$DOCKER_TRIGGER_URL")

if [ "$RESULT" = "OK" ]; then
	echo "GitLab Trigger sent successfully"
else
	echo "ERROR: GitLab Trigger not sent successfully"
	echo "$RESULT"
fi
