FROM centos:7

RUN yum makecache fast
RUN yum update -y
RUN yum install -y wget epel-release
RUN wget https://dl.yarnpkg.com/rpm/yarn.repo -O /etc/yum.repos.d/yarn.repo
RUN rpm -ivh https://kojipkgs.fedoraproject.org//packages/http-parser/2.7.1/3.el7/x86_64/http-parser-2.7.1-3.el7.x86_64.rpm && yum -y install nodejs
RUN yum install -y yarn 
RUN mkdir -p /app
COPY . /app
#COPY launchpoint.sh /
#RUN cd /app
WORKDIR /app
RUN npm install
#COPY bin/entrypoint.sh 
#CMD ["./launchpoint.sh"]
#FROM node:8.1.4-alpine
#
#MAINTAINER Vault-UI Contributors
#
#WORKDIR /app
#COPY . .
#
#RUN yarn install --pure-lockfile --silent && \
#    yarn run build-web && \
#    yarn install --silent --production && \
#    yarn check --verify-tree --production && \
#    yarn global add nodemon && \
#    yarn cache clean && \
#    rm -f /root/.electron/*
#
#EXPOSE 8000
#
#ENTRYPOINT ["./bin/entrypoint.sh"]
#CMD ["start_app"]
