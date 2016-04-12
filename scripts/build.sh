#!/bin/bash

#Exit when simple command fails
set -e

#step one update config files
#update etcd2 discovery token
echo "Downloading new discovery token..."
cp cc-nginx/pxe-cloud-config.yml.template cc-nginx/pxe-cloud-config.yml
discoveryUrl=`scripts/newDiscoveryToken.sh`
sed -i "s,<discoveryTokenUrlHere>,$discoveryUrl,g" cc-nginx/pxe-cloud-config.yml

#build ipxe bootfile
scripts/buildBootImage.sh 			> /dev/null &
bibpid=$!


#step two build docker images
docker build -t housek/cc-dhcp cc-dhcp		> /dev/null &
docker build -t housek/cc-nginx cc-nginx	> /dev/null &
echo "Building all Docker images (This could take a long time) please wait..."
echo "Waiting for bootimage to complete building before starting tftp server build..."
wait $bibpid
echo "Started building tftp server..."
docker build -t housek/cc-tftp cc-tftp		> /dev/null &
echo "Waiting for all remaining processes to end..."
wait
echo "All docker images build. We are done."
exit 0
