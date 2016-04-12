# coreOScluster
Docker images for deploying a pxe server that boots coreOS cluster nodes that compute for universe@home
A registry mirror is used to cache docker image downloads

usage
run following command:
wget https://raw.githubusercontent.com/HouseK/coreOScluster/master/docker-compose.yml && docker-compose up

It wil download the docker-compose file en start all nessecary services.

After the services are started boot a pxe capable system on the same LAN.


To-Do:
  use separate container to build ipxe boot image (more flexible and efficient build times)
  make scripts more dynamic with variables
