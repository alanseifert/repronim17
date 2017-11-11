#!/bin/bash

# pull neurodocker image
docker pull kaczmarj/neurodocker:master

# prepare Dockerfile with fsl
docker run -it --rm kaczmarj/neurodocker:master generate \
	-b neurodebian:stretch-non-free \
	-p apt \
	--install fsl-core vim \
	--add-to-entrypoint "source /etc/fsl/fsl.sh" \
	--no-check-urls > xugroup.dockerfile

