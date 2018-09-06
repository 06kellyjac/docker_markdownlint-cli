# Docker `markdownlint-cli`

This branch is for polling `npm` Hourly for a new version and triggering Docker Hub to rebuild the image if
it's behind.

The CI schedule is set to `0,15,30,45 * * * *` which should run the pipeline every quarter hour.
Public GitLab only runs schedules at `19 * * * *` so the maximum rate is hourly at XX:19.

<https://docs.gitlab.com/ee/user/gitlab_com/#cron-jobs>

For more details on this repository including the Licence please visit:
<https://gitlab.com/06kellyjac/docker_markdownlint-cli>
