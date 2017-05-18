# gitlab-runner

A derived version of [gitlab-runner](https://hub.docker.com/r/gitlab/gitlab-runner/) tailored for running as a Docker swarm service.

Based on the alpine tag, it basically adds an automatic registration if the config file does not exists. The registration will be performed non-interactively using environment variables to set various options.

## Environment variables

### To be defined

The following variables *must* be defined in order to have a working runner:

- `CI_SERVER_URL`: the url of the Gitlab server
- `REGISTRATION_TOKEN`: registration token from the Gitlab server above
- `CI_SERVER_TOKEN`: an alternative to `REGISTRATION_TOKEN` the value should be the one found in an existing `config.toml` from an already registered runner

### Pre-defined environment variables

The following variables are already defined to sensible values but can be overridden.

- `DOCKER_PRIVILEGE=true`
- `RUNNER_EXECUTOR=docker`
- `DOCKER_IMAGE=docker:git`
- `DOCKER_VOLUMES=DOCKER_VOLUMES`

### Volumes and Environment

`DOCKER_VOLUME` and `RUNNER_ENV` should allow to create an array of strings in `config.toml`. However as explained in [issue #259](https://gitlab.com/gitlab-org/gitlab-ci-multi-runner/issues/259) the runner is not able to split the variable into a TOML array. In order to work around this, the following workaround is implemented:

1. The *base* variable should contain the first entry for instance: `DOCKER_VOLUMES=DOCKER_VOLUMES`.
2. Additional entries should be placed in a variable suffixed by `_EXTRA`. The entries should be in TOML syntax that is between double quotes and separated by commas (`,`). For instance: `RUNNER_ENV_EXTRA="A=B","C=D"`.

## License

This code is distributed under the MIT license, see the [LICENSE](LICENSE) file.