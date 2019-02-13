## Install Docker
```bash
yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine

yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2

curl https://download.docker.com/linux/centos/docker-ce.repo \
  -o /etc/yum.repos.d/docker-ce.repo

yum install -y docker-ce --downloadonly
tar /var/cache/yum/x86_64/7
```


## Shipping Images
   ```bash
   image=centos ; ver=7.5.1804
   docker save fssai/$image:$ver | pxz > $image-$ver.tar.xz
   pxz -cd $image-$ver.tar.xz | docker load
   ```