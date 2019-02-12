#!/bin/bash
image=centos ; ver=7.5.1804                                         # Host CentOS Version
dir="$(dirname $(readlink -f $0))"
case "$1" in

  centos) # Official CentOS Docker Image -------------------------------------#
    docker image pull $image:$ver
    docker image tag $image:$ver fssai/$image:$ver
    docker save fssai/$image:$ver | pxz > $dir/rpm/$image-$ver.tar.xz
    pxz -cd $image-$ver.tar.xz | docker load
    ;;
  
  java) # Oracle Java
    JAVA_VER=8u201
    JAVA_URL=https://download.oracle.com/otn-pub/java/jdk/8u201-b09/42970487e3af4f5aa5bca3f542482c60/jdk-8u201-linux-x64.rpm
    curl -L -C - -b "oraclelicense=accept-securebackup-cookie" ${JAVA_URL} \
      -o $dir/rpm/jdk-${JAVA_VER}-linux-x64.rpm
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