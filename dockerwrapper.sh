#!/bin/bash

ProjName=repronimchallenge

# pull neurodocker image
docker pull kaczmarj/neurodocker:master

# prepare Dockerfile with fsl
docker run -it --rm kaczmarj/neurodocker:master generate \
	-b neurodebian:stretch-non-free \
	-p apt \
	--install fsl-core vim \
	--add-to-entrypoint "source /etc/fsl/fsl.sh" \
	--no-check-urls > ${ProjName}.Dockerfile

# build docker image
docker build -t ${ProjName} -f ${ProjName}.Dockerfile ${PWD}

# run docker image
docker run -it -v ${PWD}:/data -p 9990:9990 ${ProjName}
