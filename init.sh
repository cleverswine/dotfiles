#!/bin/bash

set -euo pipefail

# assumes sudo is installed and configured for user
# apt install sudo && usermod -aG sudo knoone

apt install xinit x11-xserver-utils i3 rxvt-unicode vim git fonts-font-awesome fonts-noto breeze-cursor-theme

# visudo
# %sudo ALL=NOPASSWD: /sbin/halt, /sbin/reboot, /sbin/poweroff