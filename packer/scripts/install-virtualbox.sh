#!/usr/bin/env bash

# Bash "strict" mode
set -euo pipefail
IFS=$'\n\t'

# VirtualBox Guest Additions
# https://wiki.archlinux.org/index.php/VirtualBox
/usr/bin/pacman -S --noconfirm virtualbox-guest-dkms virtualbox-guest-utils
echo -e 'vboxguest\nvboxsf\nvboxvideo' > /etc/modules-load.d/virtualbox.conf

/usr/bin/systemctl enable vboxservice.service
/usr/bin/systemctl enable rpcbind.service

# Add groups for VirtualBox folder sharing
/usr/bin/usermod --append --groups vagrant,vboxsf vagrant
