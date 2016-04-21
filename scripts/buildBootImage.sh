#!/bin/bash
set -e


docker build -t housek/cc-bib cc-bib
ID=`docker create housek/cc-bib`
docker cp $ID:ipxe/src/bin-x86_64-efi/ipxe.efi cc-tftp
docker rm $ID
exit 0
