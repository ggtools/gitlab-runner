FROM gitlab/gitlab-runner:alpine

LABEL maintainer "christophe@labouisse.org"

ENV DOCKER_PRIVILEGED=true \
    RUNNER_EXECUTOR=docker \
    DOCKER_IMAGE=docker:git

COPY patch/entrypoint.patch /

# Patch the entrypoint rather than replace it to be more flexible
RUN patch entrypoint entrypoint.patch
