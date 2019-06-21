#!/bin/sh
set -eu

# CI_JOB_TOKEN must be defined to trigger GitLab
[ -n "$CI_JOB_TOKEN" ]

GITLAB_TRIGGER_URL="https://gitlab.com/api/v4/projects/8206202/trigger/pipeline"
RESULT=$(wget -S -qO- --post-data "ref=master&token=$CI_JOB_TOKEN" "$GITLAB_TRIGGER_URL" 2>&1)

if echo "$RESULT" | grep -q "200 OK"; then
	echo "GitLab Trigger sent successfully"
else
	echo "ERROR: GitLab Trigger not sent successfully"
	echo "$RESULT"
fi
