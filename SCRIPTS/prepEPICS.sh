#!/bin/bash

# Helpful
#apt-cache search autoreconf

# Basic tools debian 9.1 (Scretch)
apt-get install emacs
apt-get install gcc make
sudo apt-get install git
apt-get install build-essential and linux-headers-$(uname -r)
# autoreconf needed by autogen.sh script
#apt-get install autoconf
apt-get install dh-autoreconf
# xorg-macros needed by autogen.sh
apt-get install xutils-dev

# ifconfig
apt-get install net-tools

# Base 3.15.5
apt-get install libreadline-dev

# MEDM
# msi1-7
apt-get install libmotif-dev
apt-get install libxmu-dev
#sudo /bin/bash ../libtool   --mode=install /usr/bin/install -c   libXp.la '/usr/lib/x86_64-linux-gnu'

# libxp-dev does not exist for skretch. Buid from source
apt-get install x11proto-print-dev
# http://www.aps.anl.gov/epics/tech-talk/2017/msg00513.php
git clone https://github.com/freedesktop/libXp.git


#git clone https://github.com/epics-extensions/medm
wget -c https://github.com/epics-extensions/medm/archive/MEDM3_1_14.tar.gz

# stream
sudo apt-get install libpcre3-dev
