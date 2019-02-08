#!/bin/bash
base='7.6.1810'                                           # Host CentOS Version
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
case "$1" in

  centos) # Official CentOS Docker Image -------------------------------------#
    centos_version="CentOS-$base"
    sig_repo="https://github.com/CentOS/sig-cloud-instance-images"
    image_url=$sig_repo/raw/$centos_version/docker
    curl -o centos/centos-7-docker.tar.xz $image_url/centos-7-docker.tar.xz
    curl -o centos/scratch.Dockerfile $image_url/Dockerfile
    ;;
  
  docker) # Docker RPMs for offline installation -----------------------------#
    centos_image="centos:$base"
    docker run --rm \
      -v $dir/rpm:/rpm \
      $centos_image sh /rpm/get_rpm.sh $1
    ;;
  
  *)
    echo "Invalid option" 
    ;;

esac