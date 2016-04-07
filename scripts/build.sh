#!/bin/bash

scriptcalldir=`pwd`
tftpdir=./cc-tftp

#step one build grub uefi image
echo "Building grub2 image..."
cd $tftpdir
./buildbootimage.sh
cd $scriptcalldir

#step two build docker images
docker build -t housek/cc-dhcp cc-dhcp
docker build -t housek/cc-tftp cc-tftp
docker build -t housek/cc-nginx cc-nginx
