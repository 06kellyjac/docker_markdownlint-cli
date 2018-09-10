# Docker `markdownlint-cli`

This branch is for polling various services to ensure images on Docker Hub and GitLab are as up-to-date as possible.

There is a check of `npm` for a new version of `markdown-cli` which is stored in the `VERSION` file.
This triggers both Docker Hub and GitLab to re-build the images.

There is a check of Docker Hub for when the `node` docker image was last pushed; this is stored in the `UPDATED` file.
This triggers just GitLab as Docker Hub supports watching and rebuilding on image update out of the box.

The CI schedule is set to `0,15,30,45 * * * *` which *should* run the pipeline every quarter hour.
Public GitLab only runs schedules at `19 * * * *` so the maximum rate is hourly at XX:19.

More info on Public GitLab Schedules: <https://docs.gitlab.com/ee/user/gitlab_com/#cron-jobs>

For more details on this repository including the Licence please visit the master branch:
<https://gitlab.com/06kellyjac/docker_markdownlint-cli>
