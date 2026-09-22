#!/bin/bash

set -ex

BIN=/usr/local/bin

# Copy the incus-agent binary to /usr/local/bin (mutable path in Kairos)
mkdir -p $BIN
cp incus-agent $BIN/incus-agent
chmod +x "$BIN/incus-agent"

# Detect init system and setup accordingly
if command -v systemctl >/dev/null 2>&1; then
    echo "Setting up incus-agent for systemd"

    cp assets/incus-agent.service /etc/systemd/system/incus-agent.service
    mkdir -p /etc/systemd/system/multi-user.target.wants
    ln -sf /etc/systemd/system/incus-agent.service /etc/systemd/system/multi-user.target.wants/incus-agent.service

    if systemctl is-system-running >/dev/null 2>&1; then
        systemctl start incus-agent
        systemctl enable incus-agent
    else
        echo "Systemd is available but not running. Service will start on next boot."
    fi

else
    echo "Warning: systemd not detected. incus-agent service not started."
    echo "You may need to start it manually."
    exit 0
fi
