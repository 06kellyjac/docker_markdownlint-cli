#!/bin/sh
set -eu

GITLAB_TRIGGER_URL="https://gitlab.com/api/v4/projects/8206202/trigger/pipeline"
wget -q --post-data "ref=master&token=$CI_JOB_TOKEN" $GITLAB_TRIGGER_URL
