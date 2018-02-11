#!/bin/bash

sudo apt -qq --assume-yes install rxvt-unicode

cp -f -v rxvt/.Xresources ~/

mkdir tmp
git clone https://github.com/lexachsar/Dotfiles rxvt/tmp/Dotfiles

cp -f -v rxvt/tmp/Dotfiles/tmux/.tmux.conf ~/

rm -r -f rxvt/tmp
