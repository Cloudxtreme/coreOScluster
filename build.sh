#!/bin/bash
docker build -t housek/cc-dhcp cc-dhcp
docker build -t housek/cc-tftp cc-tftp
docker build -t housek/cc-nginx cc-nginx
exit 0
