#!/bin/bash

set -euo pipefail

apt install -y xinit x11-xserver-utils i3 i3blocks vim git fonts-noto chromium sudo xcursor-themes breeze-cursor-theme xbacklight
usermod -aG sudo knoone
# visudo