#!/bin/sh
set -eu

TARGET_FILE="$1"
OLD_CONTENTS="$2"
NEW_CONTENTS="$3"

USERNAME="06kellyjac - CI"
EMAIL="06kellyjac@googlemail.com"

echo "Preparing git"

apk add --update openssh-client

eval "$(ssh-agent -s)"
echo "$SSH_KEY" | tr -d '\r' | ssh-add - > /dev/null
mkdir -p ~/.ssh && chmod 700 ~/.ssh
ssh-keyscan gitlab.com >> ~/.ssh/known_hosts && chmod 644 ~/.ssh/known_hosts

apk add --update git

# Setup git config
git config --global user.name "$USERNAME" && git config --global user.email "$EMAIL"

# Make sure the origin is using git rather than https
git remote set-url origin git@gitlab.com:06kellyjac/docker_markdownlint-cli.git

# Update the version file
echo "$NEW_CONTENTS" > "$TARGET_FILE"
echo "Committing the change"
git commit -am "[CI] Changed \`$TARGET_FILE\`: $OLD_CONTENTS -> $NEW_CONTENTS"
echo
echo "Pushing the change"
git push origin HEAD:"$CI_COMMIT_REF_NAME"
