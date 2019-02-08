#!/bin/bash

# Download Docker for offline installation -----------------------------------#
host_os="centos:7.6.1810"
docker run --rm \
  -v ./rpm:/packages \
  $host_os sh /rpm/get_rpm.sh docker

# Official CentOS ------------------------------------------------------------#
centos_version="CentOS-7.6.1810"
sig_repo="https://github.com/CentOS/sig-cloud-instance-images"

image_url=$sig_repo/raw/$centos_version/docker
curl -o centos/centos-7-docker.tar.xz $image_url/centos-7-docker.tar.xz  
curl -o centos/scratch.Dockerfile $image_url/Dockerfile