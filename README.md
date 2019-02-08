# Setup Docker in an air-gapped environment
An air-gapped environment which is to say that production systems are not connected to the open Internet.
> This repository is for using Docker on [MeghRaj National Cloud by NIC](https://cloud.gov.in) with only access to official yum repositories.

## FSSAI Images

| Images | Version |
|-------|--------:|
|[![CentOS](https://img.shields.io/docker/pulls/fssai/centos.svg?link=https://hub.docker.com/r/fssai/centos&colorB=green&label=CentOS&logoColor=brightgreen&style=popout-square&logo=linux)](https://hub.docker.com/r/fssai/centos) | 7.5.1804 |
|[![Nginx](https://img.shields.io/docker/pulls/fssai/nginx.svg?colorB=green&label=Nginx&logoColor=brightgreen&style=popout-square&logo=nginx)](https://hub.docker.com/r/fssai/nginx) | 1.14.2 |
|[![Node.js](https://img.shields.io/docker/pulls/fssai/node.svg?colorB=green&label=Node.js&logoColor=brightgreen&style=popout-square&logo=Node.js)](https://hub.docker.com/r/fssai/node) | 10.15.1|
|[![Java](https://img.shields.io/docker/pulls/fssai/java.svg?colorB=green&label=Java&logoColor=brightgreen&style=popout-square&logo=java)](https://hub.docker.com/r/fssai/java) |To build|
|[![PostgreSQL](https://img.shields.io/docker/pulls/fssai/postgres.svg?colorB=green&label=PostgreSQL&logoColor=brightgreen&style=popout-square&logo=postgresql)](https://hub.docker.com/r/fssai/postgres) |To build|

----------------
## TO DO LIST
- [ ] Install Docker Offline
- [ ] Build Base Images
  - FROM scratch
    - [x] CentOS
  - FROM CENTOS
    - [x] NGINX
    - [x] nodeJS + YARN
    - [ ] JAVA + Tomcat
    - [ ] PostgreSQL
- [ ] Create Private Docker Registry
