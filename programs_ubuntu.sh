#!/bin/bash
sudo apt-get install -y git build-essential neovim-qt rxvt-unicode ffmpeg youtube-dl libxft-dev dmenu feh apt-file libreoffice gnumeric gimp audacity qemu linux-tools-common linux-tools-generic golang-go cargo bpfcc-tools

# Required for vagrant (the lastest version of vagrant has to be downloaded from the website)
sudo apt-get install -y virtualbox linux-headers-generic virtualbox-dkms nfs-kernel-server

sudo apt-get install -y exfat-fuse exfat-utils

# DE
sudo apt-get install -y i3 fonts-font-awesome
