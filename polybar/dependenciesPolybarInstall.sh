#!/bin/bash

# Variable needed for clear code
# Just type $install <software> to install software
install="apt -qq --assume-yes install"


# Required
$install cmake
$install cmake-data
$install libcairo2-dev
$install libxcb1-dev
$install libxcb-ewmh-dev
$install libxcb-icccm4-dev
$install libxcb-image0-dev
$install libxcb-randr0-dev
$install libxcb-util0-dev
$install libxcb-xkb-dev
$install pkg-config
$install python-xcbgen
$install xcb-proto

# Enables support for getting values from the X resource db
$install libxcb-xrm-dev

# Enables support for the `cursor-click` and `cursor-scroll` settings
$install libxcb-cursor-dev

# Enables the internal i3 module
$install i3-wm

# Enables the internal volume module
$install libasound2-dev

# Enables the internal pulseaudio module
$install libpulse-dev

# Enables the internal mpd module
$install libmpdclient-dev

# Enables the internal network module
$install libiw-dev

# Enables the internal github module
$install libcurl4-openssl-dev
