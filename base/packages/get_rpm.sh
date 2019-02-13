#!/bin/bash
packages="$(dirname $(readlink -f $0))"
yumdir=/var/cache/yum/x86_64/7

function copy_rpm {
 cp -av $yumdir/*/packages/*.rpm $packages
}
function make_repo {
  yum install -y createrepo  
  createrepo -v $packages
}

case $1 in

  docker) # Getting Docker RPMs --------------------------------------------- #
    curl -sL https://download.docker.com/linux/centos/docker-ce.repo \
      -o /etc/yum.repos.d/docker-ce.repo
    yum -y install docker-ce libsepol-devel libselinux-devel --downloadonly
    copy_rpm
    ;;

  nginx)
    read -r -d '' NGINX_REPO << EOM
[nginx-stable]
name=nginx stable repo
baseurl=http://nginx.org/packages/centos/\$releasever/\$basearch/
gpgcheck=1
enabled=1                 
gpgkey=https://nginx.org/keys/nginx_signing.key               
EOM
    echo "$NGINX_REPO" > /etc/yum.repos.d/nginx.repo  
    yum install -y nginx --downloadonly
    mv $yumdir/nginx-stable/packages/*.rpm $rpmdir
    ;;
  
  node)
    curl -sL https://rpm.nodesource.com/setup_10.x | bash -
    curl -sL https://dl.yarnpkg.com/rpm/yarn.repo -o /etc/yum.repos.d/yarn.repo
    yum -y install nodejs yarn --downloadonly
    mv $yumdir/nodesource/packages/*.rpm $rpmdir
    mv $yumdir/yarn/packages/*.rpm $rpmdir
    ;;
  
  postgres)
    yum install -y https://download.postgresql.org/pub/repos/yum/10/redhat/\
rhel-7-x86_64/pgdg-centos10-10-2.noarch.rpm
    yum install -y postgresql10-server
    ;;
    
  *) 
    echo "Invalid option"
    ;;

esac
