#!/bin/bash
set -e
source ./svn.env

# Frontend
svn co $svn_url/Frontend \
  --non-interactive \
  --no-auth-cache \
  --username $svn_user \
  --password $svn_pass
  
docker build -t foscos_dev ./Frontend