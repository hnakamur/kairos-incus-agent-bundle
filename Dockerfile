# syntax=docker/dockerfile:1

# https://kairos.io/docs/advanced/bundles/

FROM scratch

ARG INCUS_VERSION=v7.4.0

ADD --chmod=400 https://github.com/lxc/incus/blob/${INCUS_VERSION}/internal/server/instance/drivers/agent-loader/systemd/incus-agent.rules /udev/99-incus-agent.rules
ADD --chmod=400 https://github.com/lxc/incus/blob/${INCUS_VERSION}/internal/server/instance/drivers/agent-loader/systemd/incus-agent.service /systemd/incus-agent.service
ADD --chmod=500 https://github.com/lxc/incus/blob/${INCUS_VERSION}/internal/server/instance/drivers/agent-loader/incus-agent-setup-linux /systemd/incus-agent-setup

ADD --chmod=500 https://github.com/lxc/incus/blob/${INCUS_VERSION}/internal/server/instance/drivers/agent-loader/incus-agent-setup-linux /run.sh
