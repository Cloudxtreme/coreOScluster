#/bin/bash
curl -s --retry 5 -w "\n" 'https://discovery.etcd.io/new?size=3'
