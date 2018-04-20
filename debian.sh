#!/bin/bash

# RUN THIS FROM $HOME

if [ ! -f Xresources-themes ]; then
  git clone https://github.com/logico-dev/Xresources-themes
fi
if [ ! -f bin ]; then
  mkdir bin
fi
cp -rf dotfiles/manjaro-scripts/* bin/
cp -f dotfiles/i3config .config/i3/config
cp -f dotfiles/i3blocks.conf .config/i3/
cp -f dotfiles/.Xresources 
cp -f dotfiles/.bashrc 
cp -f dotfiles/.profile 
