[//]: # (<!-- markdownlint-disable MD013 -->)

[docker_stars_shield]: https://img.shields.io/docker/stars/06kellyjac/markdownlint-cli.svg?style=flat-square
[docker_pulls_shield]: https://img.shields.io/docker/pulls/06kellyjac/markdownlint-cli.svg?style=flat-square
[docker_build_shield]: https://img.shields.io/docker/build/06kellyjac/markdownlint-cli.svg?style=flat-square
[docker_hub]: https://hub.docker.com/r/06kellyjac/markdownlint-cli/
[docker_hub_build]: https://hub.docker.com/r/06kellyjac/markdownlint-cli/builds/

[![Docker Stars][docker_stars_shield]][docker_hub] [![Docker Pulls][docker_pulls_shield]][docker_hub] [![Docker Build Status][docker_build_shield]][docker_hub_build]

[pipeline_badge]: https://gitlab.com/06kellyjac/docker_markdownlint-cli/badges/master/pipeline.svg
[pipeline_link]: https://gitlab.com/06kellyjac/docker_markdownlint-cli/pipelines

[![Pipeline][pipeline_badge]][pipeline_link]

The CI is scheduled to check every 15 minutes for a new version of `markdownlint-cli` on `npm` and trigger a new build to ensure the `latest` Docker image is always up to date.

<https://gitlab.com/06kellyjac/docker_markdownlint-cli/pipeline_schedules>

# Supported tags and respective `Dockerfile` links

[latest_dockerfile]: https://gitlab.com/06kellyjac/docker_markdownlint-cli/blob/master/alpine/latest/Dockerfile
[0.13.0_dockerfile]: https://gitlab.com/06kellyjac/docker_markdownlint-cli/blob/master/alpine/0.13.0/Dockerfile
[0.12.0_dockerfile]: https://gitlab.com/06kellyjac/docker_markdownlint-cli/blob/master/alpine/0.12.0/Dockerfile
[0.11.0_dockerfile]: https://gitlab.com/06kellyjac/docker_markdownlint-cli/blob/master/alpine/0.11.0/Dockerfile
[0.10.0_dockerfile]: https://gitlab.com/06kellyjac/docker_markdownlint-cli/blob/master/alpine/0.10.0/Dockerfile

[latest_slim_dockerfile]: https://gitlab.com/06kellyjac/docker_markdownlint-cli/blob/master/slim/latest/Dockerfile
[0.13.0_slim_dockerfile]: https://gitlab.com/06kellyjac/docker_markdownlint-cli/blob/master/slim/0.13.0/Dockerfile
[0.12.0_slim_dockerfile]: https://gitlab.com/06kellyjac/docker_markdownlint-cli/blob/master/slim/0.12.0/Dockerfile
[0.11.0_slim_dockerfile]: https://gitlab.com/06kellyjac/docker_markdownlint-cli/blob/master/slim/0.11.0/Dockerfile
[0.10.0_slim_dockerfile]: https://gitlab.com/06kellyjac/docker_markdownlint-cli/blob/master/slim/0.10.0/Dockerfile

- [`latest`: (*alpine/latest/Dockerfile*)][latest_dockerfile]
- [`latest-slim`: (*slim/latest/Dockerfile*)][latest_slim_dockerfile]
- [`0.13.0-alpine`, `0.13.0`: (*alpine/0.13.0/Dockerfile*)][0.13.0_dockerfile]
- [`0.13.0-slim`: (*slim/0.13.0/Dockerfile*)][0.13.0_slim_dockerfile]
- [`0.12.0-alpine`, `0.12.0`: (*alpine/0.12.0/Dockerfile*)][0.12.0_dockerfile]
- [`0.12.0-slim`: (*slim/0.12.0/Dockerfile*)][0.12.0_slim_dockerfile]
- [`0.11.0-alpine`, `0.11.0`: (*alpine/0.11.0/Dockerfile*)][0.11.0_dockerfile]
- [`0.11.0-slim`: (*slim/0.11.0/Dockerfile*)][0.11.0_slim_dockerfile]
- [`0.10.0-alpine`, `0.10.0`: (*alpine/0.10.0/Dockerfile*)][0.10.0_dockerfile]
- [`0.10.0-slim`: (*slim/0.10.0/Dockerfile*)][0.10.0_slim_dockerfile]

The Docker file also visible on the Docker Hub page: <https://hub.docker.com/r/06kellyjac/markdownlint-cli/~/dockerfile/>

# How to use this image

TODO

GitLab CI Example:

```YAML
my_markdownlint_job:
  image:
    name: 06kellyjac/markdownlint-cli:latest
    entrypoint:
      - "/usr/bin/env"
      - "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
  before_script:
    - markdownlint --version
  script:
    - markdownlint my_file.md
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
