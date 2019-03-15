#!/bin/bash

echo
echo
echo
figlet JamBox
echo
echo
echo

echo ${JAMBOX_PASSWORD} | passwd user --stdin

ssh-keygen -t rsa     -f /etc/ssh/ssh_host_rsa_key     -N ''
ssh-keygen -t ecdsa   -f /etc/ssh/ssh_host_ecdsa_key   -N ''
ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -N ''

socat tcp-listen:${JAMBOX_OUT},fork tcp:host.docker.internal:2222 &

/usr/sbin/sshd -D -e
