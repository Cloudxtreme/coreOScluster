#!/bin/bash

#step one update config files
#update etcd2 discovery token
cp cc-nginx/pxe-cloud-config.yml.template cc-nginx/pxe-cloud-config.yml
sed -i "s/<discoveryTokenUrlHere>/$(scripts/newDiscoveryToken.sh)/g" cc-nginx/pxe-cloud-config.yml



#step two build docker images
docker build -t housek/cc-dhcp cc-dhcp
docker build -t housek/cc-tftp cc-tftp
docker build -t housek/cc-nginx cc-nginx
