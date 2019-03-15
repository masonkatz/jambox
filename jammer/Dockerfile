FROM centos:7

RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN yum install -y figlet socat squid autossh; yum update -y; yum clean all

RUN useradd -s /sbin/nologin jb
RUN mkdir /home/jb/.ssh; chown jb.jb /home/jb/.ssh; chmod 700 /home/jb/.ssh;

ADD start.sh /start.sh

ENTRYPOINT ["/bin/bash", "/start.sh"]

