FROM centos:7

EXPOSE 22

RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN yum install -y figlet socat squid autossh; yum update -y; yum clean all

RUN useradd user
RUN mkdir /home/user/.ssh; chown user.user /home/user/.ssh; chmod 700 /home/user/.ssh;

ADD start.sh /start.sh

ENTRYPOINT ["/bin/bash", "/start.sh"]

