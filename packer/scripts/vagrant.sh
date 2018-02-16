#!/usr/bin/env bash

# Bash "strict" mode
set -euo pipefail
IFS=$'\n\t'

date | sudo tee /etc/vagrant_box_build_time

# Install vagrant ssh key
mkdir -p /home/vagrant/.ssh
wget --no-check-certificate -O /home/vagrant/.ssh/authorized_keys 'https://raw.githubusercontent.com/hashicorp/vagrant/master/keys/vagrant.pub'
chown -R vagrant /home/vagrant/.ssh
chmod -R go-rwsx /home/vagrant/.ssh

# Add vagrant user to passwordless sudo
echo 'Defaults:vagrant !requiretty' > /etc/sudoers.d/vagrant
echo 'vagrant ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers.d/vagrant
chmod 440 /etc/sudoers.d/vagrant

# Add vagrant user to the ssh
usermod -a -G ssh vagrant

