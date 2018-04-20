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
cp -rf dotfiles/manjaro-scripts/* bin/
cp -f dotfiles/i3config .config/i3/config
cp -f dotfiles/i3blocks.conf .config/i3/
cp -f dotfiles/i3status.conf .config/i3/
cp -f dotfiles/.Xresources ./
cp -f dotfiles/.bashrc ./
cp -f dotfiles/.profile ./
cp -f dotfiles/fonts/* ./.fonts/
