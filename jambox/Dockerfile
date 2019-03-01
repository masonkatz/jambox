FROM masonkatz/base

EXPOSE 22

RUN yum -y install openssh-server openssh-client; yum clean all
RUN useradd user

ADD start.sh /start.sh

ENTRYPOINT ["/bin/bash", "/start.sh"]

