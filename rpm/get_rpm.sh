#!/bin/bash
rpmdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
function tar_rpm {
  tar -C /var/cache/yum/x86_64/7/$1 -cJvf "$rpmdir/$1".tar.xz packages
}
# Getting Docker RPMs ------------------------------------------------------- #
curl -sL https://download.docker.com/linux/centos/docker-ce.repo \
  -o /etc/yum.repos.d/docker-ce.repo
yum -y install docker-ce --downloadonly
tar_rpm docker-ce-stable