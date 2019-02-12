# STAGE 1: svn checkout
FROM fssai/centos:7.5.1804 as svn
## svn credintials
ARG SVN_URL
ARG SVN_USER
ARG SVN_PASS

RUN yum -y install subversion \
 && svn co $SVN_URL/Frontend \
  --non-interactive \
  --no-auth-cache \
  --username $SVN_USER \
  --password $SVN_PASS 

# STAGE 2: for development
FROM fssai/node:10.15.1 as devel
COPY --from=svn /Frontend/package.json /Frontend/package-lock.json ./
RUN npm set progress=false \
 && npm config set depth 0 \
 && npm cache clean --force \
 && npm install
WORKDIR /app
COPY --from=svn /Frontend .
RUN cp -R /node_modules . \
 && $(npm bin)/ng build
EXPOSE 1000
CMD [ "./node_modules/.bin/ng", "serve", \
      "--port", "1000", "--host", "0.0.0.0" \ 
    ]

# STAGE 3: for Production    
FROM fssai/nginx:1.14.2
WORKDIR /usr/share/nginx/html
COPY --from=devel /app/dist .