#!/usr/bin/env bash

# Bash "strict" mode
set -euo pipefail
IFS=$'\n\t'

# Install vagrant ssh key
mkdir -p /home/vagrant/.ssh
chmod 0700 /home/vagrant/.ssh
if [[ ! -f /home/vagrant/.ssh/authorized_keys ]]; then
    curl -fsSL -o /home/vagrant/.ssh/authorized_keys 'https://raw.githubusercontent.com/hashicorp/vagrant/master/keys/vagrant.pub'
    chmod 0600 /home/vagrant/.ssh/authorized_keys
fi

# Add vagrant user to passwordless sudo
if [[ ! -f /etc/sudoers.d/vagrant ]]; then
    echo 'Defaults:vagrant !requiretty' > /etc/sudoers.d/vagrant
    echo 'vagrant ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers.d/vagrant
    chmod 440 /etc/sudoers.d/vagrant
fi

# Add vagrant user to the ssh
if ! groups vagrant | grep &>/dev/null '\bssh\b'; then
    usermod -a -G ssh vagrant
fi

