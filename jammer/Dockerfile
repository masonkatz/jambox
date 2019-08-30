FROM centos:7

RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN yum install -y figlet socat squid autossh; yum update -y; yum clean all

RUN useradd jam
RUN mkdir /home/jam/.ssh; chown jam.jam /home/jam/.ssh; chmod 700 /home/jam/.ssh;

ADD start.sh /start.sh

ENTRYPOINT ["/bin/bash", "/start.sh"]

