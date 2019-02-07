# Setup Docker in an air-gapped environment
MeghRaj (NIC Cloud) is an air-gapped environment which is to say that production systems are not connected to the open Internet.


## Images

| Image | Version |  
|-------|--------:|
|CentOS | 7.6.1810 |
|NGINX | 1.14.2 |
|nodeJS | 10.15.1|
|YARN | 1.13.0|

----------------
## TO DO
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