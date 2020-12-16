[//]: # (This file is templated, please edit it in the templates folder)

[//]: # (<!-- markdownlint-disable MD013 -->)
[//]: # (Disabled MD013 due to how Docker Hub formats newlines in markdown)
[//]: # (Also using this funky commenting because Docker Hub shows HTML style markdown comments)

[docker_stars_shield]: https://img.shields.io/docker/stars/06kellyjac/markdownlint-cli.svg?style=flat-square
[docker_pulls_shield]: https://img.shields.io/docker/pulls/06kellyjac/markdownlint-cli.svg?style=flat-square
[docker_build_shield]: https://img.shields.io/docker/build/06kellyjac/markdownlint-cli.svg?style=flat-square
[docker_hub]: https://hub.docker.com/r/06kellyjac/markdownlint-cli/
[docker_hub_build]: https://hub.docker.com/r/06kellyjac/markdownlint-cli/builds/

Docker Hub Badges

[![Docker Build Status][docker_build_shield]][docker_hub_build] [![Docker Stars][docker_stars_shield]][docker_hub] [![Docker Pulls][docker_pulls_shield]][docker_hub]

[pipeline_badge]: https://gitlab.com/06kellyjac/docker_markdownlint-cli/badges/master/pipeline.svg
[pipeline_link]: https://gitlab.com/06kellyjac/docker_markdownlint-cli/pipelines
[scanning_badge]: https://img.shields.io/badge/security_scanning-click_me-%231DA0F7.svg
[security_dashboard_link]: https://gitlab.com/06kellyjac/docker_markdownlint-cli/security/dashboard

GitLab Badges

[![Pipeline][pipeline_badge]][pipeline_link] [![Security Scanning][scanning_badge]][security_dashboard_link]

[//]: # (TODO: Swap to official scanning badges in the future: <https://gitlab.com/gitlab-org/gitlab-ee/issues/4713> <https://gitlab.com/gitlab-org/gitlab-foss/issues/49874>)

[microbadger_latest_shield]: https://images.microbadger.com/badges/image/06kellyjac/markdownlint-cli.svg
[microbadger_latest]: https://microbadger.com/images/06kellyjac/markdownlint-cli
[microbadger_latest-slim_shield]: https://images.microbadger.com/badges/image/06kellyjac/markdownlint-cli:latest-slim.svg
[microbadger_latest]: https://microbadger.com/images/06kellyjac/markdownlint-cli
[microbadger_latest-slim]: https://microbadger.com/images/06kellyjac/markdownlint-cli:latest-slim

MicroBadger

| Tag | Badge |
|-----|-------|
| `latest` | [![MicroBadger Details - latest][microbadger_latest_shield]][microbadger_latest] |
| `latest-slim` | [![MicroBadger Details - latest-slim][microbadger_latest-slim_shield]][microbadger_latest-slim] |

The CI is scheduled to check every hour to check `npm` for the latest version of `markdownlint-cli` and check Docker Hub for the latest version of the `node` docker image.

The schedule: <https://gitlab.com/06kellyjac/docker_markdownlint-cli/pipeline_schedules>

More information on the polling: <https://gitlab.com/06kellyjac/docker_markdownlint-cli/blob/polling/README.md>

There is also Clair security scanning performed on this container; click the badge above or [click here][security_dashboard_link] to view the result.

# Supported tags and respective `Dockerfile` links

[latest_dockerfile]: https://gitlab.com/06kellyjac/docker_markdownlint-cli/blob/master/alpine/Dockerfile.latest
[0.26.0_dockerfile]: https://gitlab.com/06kellyjac/docker_markdownlint-cli/blob/master/alpine/Dockerfile.0.26.0
[0.25.0_dockerfile]: https://gitlab.com/06kellyjac/docker_markdownlint-cli/blob/master/alpine/Dockerfile.0.25.0
[0.24.0_dockerfile]: https://gitlab.com/06kellyjac/docker_markdownlint-cli/blob/master/alpine/Dockerfile.0.24.0
[0.23.0_dockerfile]: https://gitlab.com/06kellyjac/docker_markdownlint-cli/blob/master/alpine/Dockerfile.0.23.0
[0.22.0_dockerfile]: https://gitlab.com/06kellyjac/docker_markdownlint-cli/blob/master/alpine/Dockerfile.0.22.0
[0.21.0_dockerfile]: https://gitlab.com/06kellyjac/docker_markdownlint-cli/blob/master/alpine/Dockerfile.0.21.0
[0.20.0_dockerfile]: https://gitlab.com/06kellyjac/docker_markdownlint-cli/blob/master/alpine/Dockerfile.0.20.0
[0.19.0_dockerfile]: https://gitlab.com/06kellyjac/docker_markdownlint-cli/blob/master/alpine/Dockerfile.0.19.0
[0.18.0_dockerfile]: https://gitlab.com/06kellyjac/docker_markdownlint-cli/blob/master/alpine/Dockerfile.0.18.0
[0.17.0_dockerfile]: https://gitlab.com/06kellyjac/docker_markdownlint-cli/blob/master/alpine/Dockerfile.0.17.0
[0.16.0_dockerfile]: https://gitlab.com/06kellyjac/docker_markdownlint-cli/blob/master/alpine/Dockerfile.0.16.0
[0.15.0_dockerfile]: https://gitlab.com/06kellyjac/docker_markdownlint-cli/blob/master/alpine/Dockerfile.0.15.0
[0.14.0_dockerfile]: https://gitlab.com/06kellyjac/docker_markdownlint-cli/blob/master/alpine/Dockerfile.0.14.0
[0.13.0_dockerfile]: https://gitlab.com/06kellyjac/docker_markdownlint-cli/blob/master/alpine/Dockerfile.0.13.0
[0.12.0_dockerfile]: https://gitlab.com/06kellyjac/docker_markdownlint-cli/blob/master/alpine/Dockerfile.0.12.0
[0.11.0_dockerfile]: https://gitlab.com/06kellyjac/docker_markdownlint-cli/blob/master/alpine/Dockerfile.0.11.0
[0.10.0_dockerfile]: https://gitlab.com/06kellyjac/docker_markdownlint-cli/blob/master/alpine/Dockerfile.0.10.0

[latest_slim_dockerfile]: https://gitlab.com/06kellyjac/docker_markdownlint-cli/blob/master/slim/Dockerfile.latest
[0.26.0_slim_dockerfile]: https://gitlab.com/06kellyjac/docker_markdownlint-cli/blob/master/slim/Dockerfile.0.26.0
[0.25.0_slim_dockerfile]: https://gitlab.com/06kellyjac/docker_markdownlint-cli/blob/master/slim/Dockerfile.0.25.0
[0.24.0_slim_dockerfile]: https://gitlab.com/06kellyjac/docker_markdownlint-cli/blob/master/slim/Dockerfile.0.24.0
[0.23.0_slim_dockerfile]: https://gitlab.com/06kellyjac/docker_markdownlint-cli/blob/master/slim/Dockerfile.0.23.0
[0.22.0_slim_dockerfile]: https://gitlab.com/06kellyjac/docker_markdownlint-cli/blob/master/slim/Dockerfile.0.22.0
[0.21.0_slim_dockerfile]: https://gitlab.com/06kellyjac/docker_markdownlint-cli/blob/master/slim/Dockerfile.0.21.0
[0.20.0_slim_dockerfile]: https://gitlab.com/06kellyjac/docker_markdownlint-cli/blob/master/slim/Dockerfile.0.20.0
[0.19.0_slim_dockerfile]: https://gitlab.com/06kellyjac/docker_markdownlint-cli/blob/master/slim/Dockerfile.0.19.0
[0.18.0_slim_dockerfile]: https://gitlab.com/06kellyjac/docker_markdownlint-cli/blob/master/slim/Dockerfile.0.18.0
[0.17.0_slim_dockerfile]: https://gitlab.com/06kellyjac/docker_markdownlint-cli/blob/master/slim/Dockerfile.0.17.0
[0.16.0_slim_dockerfile]: https://gitlab.com/06kellyjac/docker_markdownlint-cli/blob/master/slim/Dockerfile.0.16.0
[0.15.0_slim_dockerfile]: https://gitlab.com/06kellyjac/docker_markdownlint-cli/blob/master/slim/Dockerfile.0.15.0
[0.14.0_slim_dockerfile]: https://gitlab.com/06kellyjac/docker_markdownlint-cli/blob/master/slim/Dockerfile.0.14.0
[0.13.0_slim_dockerfile]: https://gitlab.com/06kellyjac/docker_markdownlint-cli/blob/master/slim/Dockerfile.0.13.0
[0.12.0_slim_dockerfile]: https://gitlab.com/06kellyjac/docker_markdownlint-cli/blob/master/slim/Dockerfile.0.12.0
[0.11.0_slim_dockerfile]: https://gitlab.com/06kellyjac/docker_markdownlint-cli/blob/master/slim/Dockerfile.0.11.0
[0.10.0_slim_dockerfile]: https://gitlab.com/06kellyjac/docker_markdownlint-cli/blob/master/slim/Dockerfile.0.10.0

Images are available on both Docker Hub and GitLab: <https://gitlab.com/06kellyjac/docker_markdownlint-cli/container_registry>

Docker Hub can easily take over **2 hours+** to queue, build, and push all the containers.
GitLab takes around **2-6 minutes** to build and push all the containers in parallel (although it can take longer to queue at "prime time").
Due to this, Images on GitLab will likely be more up-to-date by a substantial margin.

Personally I also experience faster image downloads from GitLab but your networking situation may differ.

There is a marginal difference in download speed but for using this image in your GitLab CI pipelines on [gitlab.com](https://gitlab.com) it makes sense to use the image from GitLab's own registry.

Additionally please note **Docker Hub only allows for 25 automated build tags**.

So only the last 7 versions can remain automatically building (3 tags per version & latest).
The tags should remain in Docker Hub but they won't be rebuilt with the latest patches.
All tags will continue to build with the latest patches on GitLab and go in the registry there.

- [`latest-alpine`, `latest`: (*alpine/latest/Dockerfile*)][latest_dockerfile]
- [`latest-slim`: (*slim/latest/Dockerfile*)][latest_slim_dockerfile]
- [`0.26.0-alpine`, `0.26.0`: (*alpine/0.26.0/Dockerfile*)][0.26.0_dockerfile]
- [`0.26.0-slim`: (*slim/0.26.0/Dockerfile*)][0.26.0_slim_dockerfile]
- [`0.25.0-alpine`, `0.25.0`: (*alpine/0.25.0/Dockerfile*)][0.25.0_dockerfile]
- [`0.25.0-slim`: (*slim/0.25.0/Dockerfile*)][0.25.0_slim_dockerfile]
- [`0.24.0-alpine`, `0.24.0`: (*alpine/0.24.0/Dockerfile*)][0.24.0_dockerfile]
- [`0.24.0-slim`: (*slim/0.24.0/Dockerfile*)][0.24.0_slim_dockerfile]
- [`0.23.0-alpine`, `0.23.0`: (*alpine/0.23.0/Dockerfile*)][0.23.0_dockerfile]
- [`0.23.0-slim`: (*slim/0.23.0/Dockerfile*)][0.23.0_slim_dockerfile]
- [`0.22.0-alpine`, `0.22.0`: (*alpine/0.22.0/Dockerfile*)][0.22.0_dockerfile]
- [`0.22.0-slim`: (*slim/0.22.0/Dockerfile*)][0.22.0_slim_dockerfile]
- [`0.21.0-alpine`, `0.21.0`: (*alpine/0.21.0/Dockerfile*)][0.21.0_dockerfile]
- [`0.21.0-slim`: (*slim/0.21.0/Dockerfile*)][0.21.0_slim_dockerfile]
- [`0.20.0-alpine`, `0.20.0`: (*alpine/0.20.0/Dockerfile*)][0.20.0_dockerfile]
- [`0.20.0-slim`: (*slim/0.20.0/Dockerfile*)][0.20.0_slim_dockerfile]
- [`0.19.0-alpine`, `0.19.0`: (*alpine/0.19.0/Dockerfile*)][0.19.0_dockerfile]
- [`0.19.0-slim`: (*slim/0.19.0/Dockerfile*)][0.19.0_slim_dockerfile]
- [`0.18.0-alpine`, `0.18.0`: (*alpine/0.18.0/Dockerfile*)][0.18.0_dockerfile]
- [`0.18.0-slim`: (*slim/0.18.0/Dockerfile*)][0.18.0_slim_dockerfile]
- [`0.17.0-alpine`, `0.17.0`: (*alpine/0.17.0/Dockerfile*)][0.17.0_dockerfile]
- [`0.17.0-slim`: (*slim/0.17.0/Dockerfile*)][0.17.0_slim_dockerfile]
- [`0.16.0-alpine`, `0.16.0`: (*alpine/0.16.0/Dockerfile*)][0.16.0_dockerfile]
- [`0.16.0-slim`: (*slim/0.16.0/Dockerfile*)][0.16.0_slim_dockerfile]
- [`0.15.0-alpine`, `0.15.0`: (*alpine/0.15.0/Dockerfile*)][0.15.0_dockerfile]
- [`0.15.0-slim`: (*slim/0.15.0/Dockerfile*)][0.15.0_slim_dockerfile]
- [`0.14.0-alpine`, `0.14.0`: (*alpine/0.14.0/Dockerfile*)][0.14.0_dockerfile]
- [`0.14.0-slim`: (*slim/0.14.0/Dockerfile*)][0.14.0_slim_dockerfile]
- [`0.13.0-alpine`, `0.13.0`: (*alpine/0.13.0/Dockerfile*)][0.13.0_dockerfile]
- [`0.13.0-slim`: (*slim/0.13.0/Dockerfile*)][0.13.0_slim_dockerfile]
- [`0.12.0-alpine`, `0.12.0`: (*alpine/0.12.0/Dockerfile*)][0.12.0_dockerfile]
- [`0.12.0-slim`: (*slim/0.12.0/Dockerfile*)][0.12.0_slim_dockerfile]
- [`0.11.0-alpine`, `0.11.0`: (*alpine/0.11.0/Dockerfile*)][0.11.0_dockerfile]
- [`0.11.0-slim`: (*slim/0.11.0/Dockerfile*)][0.11.0_slim_dockerfile]
- [`0.10.0-alpine`, `0.10.0`: (*alpine/0.10.0/Dockerfile*)][0.10.0_dockerfile]
- [`0.10.0-slim`: (*slim/0.10.0/Dockerfile*)][0.10.0_slim_dockerfile]

A `Dockerfile` is also visible on the Docker Hub page: <https://hub.docker.com/r/06kellyjac/markdownlint-cli/~/dockerfile/>

# How to use this image

If you're using the image from the GitLab registry replace all instances of `06kellyjac/markdownlint-cli` with `registry.gitlab.com/06kellyjac/docker_markdownlint-cli`.

## General

Linting one file with STDIN:

```shell
docker run -i 06kellyjac/markdownlint-cli -s < README.md
```

This is an easy way to lint one file.

---

Linting multiple files with STDIN:

```shell
cat README.md a.md b.md c.md other.md | docker run -i 06kellyjac/markdownlint-cli -s -
```

This is a quick and dirty way to lint multiple files. The downside is it's difficult to tell which file has linting issues.

---

Linting one file with STDIN and a custom `markdownlint` config

```shell
docker run -i -v $PWD/.markdownlint.json:/markdown/.markdownlint.json 06kellyjac/markdownlint-cli -s < README.md
```

This takes the first example and also mounts your `.markdownlint.json` config into the container. You may find the below example to be cleaner if all the files you want to lint are in your present working directory.

---

Linting files by mounting the whole present working directory into the container.

```shell
docker run -v $PWD:/markdown 06kellyjac/markdownlint-cli README.md a.md b.md c.md other_dir/other.md
```

or

```shell
docker run -v $PWD:/markdown 06kellyjac/markdownlint-cli .
```

This method is useful for linting files in the present working directory and also means you can mount your `.markdownlint.json` config at the same time.

With a directory structure like so, where `this_directory` is your present working directory:

```none
this_directory
├── .markdownlint.json
├── README.md
├── a.md
├── b.md
├── c.md
└── other_dir
    └── other.md
```

## CI

GitLab CI Example:

```yaml
my_markdownlint_job:
  image:
    name: 06kellyjac/markdownlint-cli:0.26.0-alpine
    # or to use the image from GitLab rather than Docker Hub
    # replace it with the line below
    # name: registry.gitlab.com/06kellyjac/docker_markdownlint-cli:0.26.0-alpine
    entrypoint:
      - "/usr/bin/env"
      - "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
  before_script:
    - markdownlint --version
  script:
    - markdownlint .
```

# Quick reference

- **Where to get help**:
  [I have contact details on my GitLab](https://gitlab.com/06kellyjac), [the Docker Community Forums](https://forums.docker.com/), [the Docker Community Slack](https://blog.docker.com/2016/11/introducing-docker-community-directory-docker-community-slack/), or [Stack Overflow](https://stackoverflow.com/search?tab=newest&q=docker)

- **Where to file issues**:
  <https://gitlab.com/06kellyjac/docker_markdownlint-cli/issues>

- **Maintained by**:
  [06kellyjac on GitLab](https://gitlab.com/06kellyjac)

- **Source of this description**:
  [The GitLab README.md](https://gitlab.com/06kellyjac/docker_markdownlint-cli/blob/master/README.md) ([history](https://gitlab.com/06kellyjac/docker_markdownlint-cli/commits/master/README.md))

# What is `markdownlint-cli`

`markdownlint-cli` is a command-line interface for the `markdownlint` library.

Thanks go to [DavidAnson](https://github.com/DavidAnson/) and [contributors](https://github.com/DavidAnson/markdownlint/graphs/contributors) on GitHub for the `markdownlint` library, and to [igorshubovych](https://github.com/igorshubovych/) and [contributors](https://github.com/igorshubovych/markdownlint-cli/graphs/contributors) on GitHub for `markdownlint-cli`.

The source used in this image:

<https://github.com/DavidAnson/markdownlint/>

<https://github.com/igorshubovych/markdownlint-cli/>

# Licence

View [markdownlint licence information](https://github.com/DavidAnson/markdownlint/blob/master/LICENSE) and [markdownlint-cli licence information](https://github.com/igorshubovych/markdownlint-cli/blob/master/LICENSE) for the software contained in this image.

View [licence information](https://gitlab.com/06kellyjac/docker_markdownlint-cli/blob/master/LICENSE) for the container set-up.
