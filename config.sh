#!/bin/bash

# RUN THIS FROM $HOME

if [ ! -d Xresources-themes ]; then
  git clone https://github.com/logico-dev/Xresources-themes
fi
if [ ! -d bin ]; then
  mkdir bin
fi
if [ ! -d .config ]; then
  mv .config .config-original
fi
cp -rf dotfiles/mine/.config ./
cp -f dotfiles/mine/.profile ./
cp -f dotfiles/mine/.Xresources ./