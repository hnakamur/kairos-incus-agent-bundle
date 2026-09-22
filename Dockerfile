# syntax=docker/dockerfile:1

# https://kairos.io/docs/advanced/bundles/

FROM alpine AS build

ARG INCUS_VERSION=v7.4.0

ADD --chmod=400 https://raw.githubusercontent.com/lxc/incus/refs/tags/${INCUS_VERSION}/internal/server/instance/drivers/agent-loader/systemd/incus-agent.rules /assets/udev/99-incus-agent.rules
ADD --chmod=400 https://raw.githubusercontent.com/lxc/incus/refs/tags/${INCUS_VERSION}/internal/server/instance/drivers/agent-loader/systemd/incus-agent.service /assets/systemd/incus-agent.service
ADD --chmod=500 https://raw.githubusercontent.com/lxc/incus/refs/tags/${INCUS_VERSION}/internal/server/instance/drivers/agent-loader/incus-agent-setup-linux /assets/systemd/incus-agent-setup
ADD --chmod=500 https://raw.githubusercontent.com/lxc/incus/refs/tags/${INCUS_VERSION}/internal/server/instance/drivers/agent-loader/install-linux.sh /assets/install.sh

FROM scratch

COPY --from=build /assets /assets
COPY /run.sh /run.sh
