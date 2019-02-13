## Install Docker
```bash
sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine

sudo yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2
```


## Shipping Images
   ```bash
   image=centos ; ver=7.5.1804
   docker save fssai/$image:$ver | pxz > $image-$ver.tar.xz
   pxz -cd $image-$ver.tar.xz | docker load
   ```