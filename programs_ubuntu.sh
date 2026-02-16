#!/bin/bash

# Development tools
sudo apt-get install -y git build-essential golang-go cargo bpfcc-tools

# Apps
neovim-qt rxvt-unicode ffmpeg youtube-dl libxft-dev dmenu feh apt-file libreoffice gnumeric gimp audacity qemu

linux-tools-common linux-tools-generic

# Management
sudo apt-get install apt-file

# Filesystem
sudo apt-get install -y exfat-fuse exfat-utils

# DE
sudo apt-get install -y i3 fonts-font-awesome

# Enable "perf" performance monitoring tools
sudo apt-get install linux-tools-common linux-tools-generic
