#!/bin/bash

echo
echo
echo
figlet Jammer
echo
echo
echo

connect="autossh -M 0 -N -oStrictHostKeyChecking=no -p${JAMBOX_IN1} -R3128:localhost:3128 -R${JAMBOX_OUT}:localhost:3129 ${JAMBOX_USER}@${JAMBOX_HOST}"

/usr/sbin/squid

socat tcp-listen:3129,fork tcp:host.docker.internal:22 &

while true; do
	echo $connect
	runuser -l jb -c "$connect"
	sleep 60
done


