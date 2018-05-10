#!/bin/bash

set -euo pipefail

sudo apt-get install xinit x11-xserver-utils xfce4 xfce4-goodies mate-icon-theme-faenza breeze-cursor-theme \
  xfce4-mount-plugin xfce4-whiskermenu-plugin mousepad xfce4-notifyd xfce4-screenshooter \
  xfce4-terminal xfce4-taskmanager gigolo ristretto vim

echo -e "\nexport EDITOR=/usr/bin/vim" >> .profile

if [ ! -d Pictures ]; then
  mkdir Pictures
fi
cp -f dotfiles/mine/background.png ./Pictures/
