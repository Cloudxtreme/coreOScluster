#!/bin/bash

read "Warning following operations erase all docker images and containers! Press Enter To Continue..."

#deletes all containers
docker rm $(docker ps -a -q)
#deletes all images
docker rmi $(docker images -q)
