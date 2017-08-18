FROM centos:7

RUN yum makecache fast
RUN yum update -y
RUN yum install -y wget epel-release
RUN wget https://dl.yarnpkg.com/rpm/yarn.repo -O /etc/yum.repos.d/yarn.repo
RUN rpm -ivh https://kojipkgs.fedoraproject.org//packages/http-parser/2.7.1/3.el7/x86_64/http-parser-2.7.1-3.el7.x86_64.rpm && yum -y install nodejs
RUN yum install -y yarn 
RUN mkdir -p /app
COPY . /app
WORKDIR /app
RUN npm install
RUN chmod +x /app/launchpoint.sh
CMD ["./app/launchpoint.sh"]
