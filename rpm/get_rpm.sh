#!/bin/bash
rpmdir="$(dirname $(readlink -f $0))"
yumdir=/var/cache/yum/x86_64/7
function tar_rpm {
  tar -C $yumdir/$1 -cJvf "$rpmdir/$1".tar.xz packages
}

read -r -d '' NGINX_REPO << EOM
[nginx-stable]
name=nginx stable repo
baseurl=http://nginx.org/packages/centos/\$releasever/\$basearch/
gpgcheck=1
enabled=1                 
gpgkey=https://nginx.org/keys/nginx_signing.key               
EOM



case $1 in

  docker) # Getting Docker RPMs --------------------------------------------- #
    curl -sL https://download.docker.com/linux/centos/docker-ce.repo \
      -o /etc/yum.repos.d/docker-ce.repo
    yum -y install docker-ce --downloadonly
    tar_rpm docker-ce-stable
    ;;

  nginx)
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
    #yum install https://download.postgresql.org/pub/repos/yum/10/redhat/rhel-7-x86_64/pgdg-centos10-10-2.noarch.rpm
    ;;
  *) 
    echo "Invalid option"
    ;;

esac
