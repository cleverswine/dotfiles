#!/bin/bash

# RUN THIS FROM $HOME

if [ ! -d Xresources-themes ]; then
  git clone https://github.com/logico-dev/Xresources-themes
fi
if [ ! -d bin ]; then
  mkdir bin
fi
if [ ! -d .fonts ]; then
  mkdir .fonts
fi
cp -rf dotfiles/mine/i3exit bin/
cp -f dotfiles/mine/i3config .config/i3/config
cp -f dotfiles/mine/i3blocks.conf .config/i3/
cp -f dotfiles/mine/i3status.conf .config/i3/
cp -f dotfiles/mine/xresources ./.Xresources
cp -f dotfiles/mine/bashrc ./.bashrc
cp -f dotfiles/mine/profile ./.profile
cp -f dotfiles/mine/fonts/* ./.fonts/
