# syntax=docker/dockerfile:1

# https://kairos.io/docs/advanced/bundles/

FROM alpine AS build

ARG INCUS_VERSION=v7.4.0
ADD https://github.com/lxc/incus/releases/download/${INCUS_VERSION}/bin.linux.incus-agent.x86_64 /incus-agent

FROM scratch

COPY --from=build /incus-agent /incus-agent
COPY run.sh /run.sh
COPY ./assets /assets
ENTRYPOINT ["/run.sh"]
