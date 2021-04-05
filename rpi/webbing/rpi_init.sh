#!/bin/bash

echo 'adding apt repo'
#repo
echo "" > /etc/apt/sources.list
apt-key adv --keyserver pool.sks-keyservers.net --recv-keys ED444FF07D8D0BF6
echo '# Kali linux repositories | Added by Katoolin' >> /etc/apt/sources.list
echo 'deb http://http.kali.org/kali kali-rolling main contrib non-free' >> /etc/apt/sources.list

echo 'moving to /opt'
cd /opt

#init
mkdir /webtmp

#networking
echo "nameserver 1.1.1.1" > /etc/resolv.conf
echo "nameserver 1.0.0.1" >> /etc/resolv.conf

sudo apt install -fy python python3 python3-pip golang openvpn tor proxychains nikto dmitry dnstracer dirb dirbuster gobuster exiftool binwalk radare2 gdb nginx
#programming language support
sudo python3 -m pip install --upgrade pip

#dirsearch
git clone https://github.com/maurosoria/dirsearch.git

#photon
git clone https://github.com/s0md3v/Photon.git
