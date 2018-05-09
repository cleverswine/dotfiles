#!/bin/bash

set -euo pipefail

# RUN THIS FROM $HOME
# assumes sudo is installed and configured for user
# apt install sudo && usermod -aG sudo knoone

sudo apt-get install -y xinit x11-xserver-utils i3 rxvt-unicode vim git \
    fonts-font-awesome fonts-noto xfonts-terminus breeze-cursor-theme lxappearance \
    alsamixergui

# sudo apt-get install xinit x11-xserver-utils cinnamon-core gnome-themes-standard gdm3 gvfs-fuse
# sudo apt-get install xinit x11-xserver-utils gdm3 xfce4 xfce4-goodies gigolo mate-icon-theme-faenza arc-theme

echo -e "\nexport EDITOR=/usr/bin/vim" >> .profile

if [ ! -d Xresources-themes ]; then
  git clone https://github.com/logico-dev/Xresources-themes
fi
if [ -d .config ]; then
  mv -f .config .config-original
fi
cp -rf dotfiles/mine/.config ./
cp -f dotfiles/mine/.Xresources ./
if [ ! -d Pictures ]; then
  mkdir Pictures
fi
cp -f dotfiles/mine/background.png ./Pictures/
