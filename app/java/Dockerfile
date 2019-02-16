FROM fssai/centos:7.5.1804 as svn
## svn credintials
ARG SVN_URL
ARG SVN_USER
ARG SVN_PASS

RUN yum -y install subversion \
 && svn co $SVN_URL/Backend \
  --non-interactive \
  --no-auth-cache \
  --username $SVN_USER \
  --password $SVN_PASS
