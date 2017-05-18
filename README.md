# gitlab-runner

A derived version of [gitlab-runner](https://hub.docker.com/r/gitlab/gitlab-runner/) tailored for running as a Docker swarm service.

Based on the alpine tag, it basically adds an automatic registration if the config file does not exists. The registration will be performed non-interactively using environment variables to set various options.

## Variables to be defined

- `CI_SERVER_URL`: the url of the Gitlab server
- `CI_SERVER_TOKEN`: the Gitlab server token

## Pre-defined environment variables

- `DOCKER_PRIVILEGE=true`
- `RUNNER_EXECUTOR=docker`
- `DOCKER_IMAGE=docker:git`
