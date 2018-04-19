#!/bin/bash

# [su] apt install xinit x11-xserver-utils i3 i3blocks vim git fonts-noto

git clone https://github.com/cleverswine/dotfiles.git
git clone https://github.com/logico-dev/Xresources-themes

mkdir $HOME/bin
cp -rf dotfiles/manjaro-scripts/* $HOME/bin/
cp -f dotfiles/i3config $HOME/.config/i3/config
cp -f dotfiles/.Xresources $HOME/
cp -f dotfiles/.profile $HOME/
cp -f manjaro-defaults/.xinitrc $HOME/

# WPA WIFI
# ########
# wpa_passphrase myssid my_very_secret_passphrase
# vi /etc/network/interfaces
#  auto wlan0
#  iface guest inet dhcp
#          wpa-ssid myssid
#          wpa-psk <wpa-psk output from above>
# ifup wlan0=guest

# sudo
# apt install sudo
# addgroup sudo
# usermod -aG sudo USERNAME
# visudo
#   %sudo ALL = (ALL) ALL