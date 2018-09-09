#!/bin/sh
set -eu

GITLAB_TRIGGER_URL="https://gitlab.com/api/v4/projects/8206202/trigger/pipeline"

RESULT=$(wget -qO- --post-data "ref=master&token=$CI_JOB_TOKEN" $GITLAB_TRIGGER_URL)

if [ "$RESULT" = "OK" ]; then
	echo "Trigger sent successfully"
else
	echo "ERROR: Trigger not sent successfully"
	echo "$RESULT"
fi
