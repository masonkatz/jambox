FROM masonkatz/base

RUN yum install -y socat autossh; yum clean all
RUN useradd user
RUN mkdir /home/user/.ssh; chown user.user /home/user/.ssh; chmod 700 /home/user/.ssh;

ADD start.sh /start.sh

ENTRYPOINT ["/bin/bash", "/start.sh"]

