FROM centos:7

EXPOSE 22

RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN yum install -y figlet openssh-server openssh-clients; yum update -y; yum clean all

RUN figlet JamBox > /etc/motd
RUN useradd user

ADD start.sh /start.sh

ENTRYPOINT ["/bin/bash", "/start.sh"]

