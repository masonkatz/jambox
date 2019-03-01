#!/bin/bash

echo
echo
echo
figlet JamBox
echo
echo
echo

echo ${JAMBOX_PASSWORD} | passwd user --stdin

ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''
/usr/sbin/sshd -D
