#!/bin/bash
set -e
docker build -t housek/cc-bib cc-bib
docker run --rm --volume ` pwd`/cc-bib/output:/output housek/cc-bib
mv -r cc-bib/output/* cc-tftp
exit 0
