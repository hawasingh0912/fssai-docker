#!/bin/bash
image=centos ; ver=7.5.1804                                         # Host CentOS Version
dir="$(dirname $(readlink -f $0))"
case "$1" in

  centos) # Official CentOS Docker Image -------------------------------------#
    
    docker image pull $image:$ver
    docker image tag $image:$ver fssai/$image:$ver
    docker save fssai/$image:$ver | pxz > $image-$ver.tar.xz
    pxz -cd $image-$ver.tar.xz | docker load
    ;;
  
  docker|nginx|node) # Docker RPMs for offline installation -----------------------------#
    centos_image="$image:$ver"
    docker run --rm \
      -v $dir/rpm:/rpm \
      $centos_image sh /rpm/get_rpm.sh $1
    ;;
  
  *)
    echo "Invalid option" 
    ;;

esac