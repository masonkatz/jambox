#!/bin/bash

echo
echo
echo
figlet Jammer
echo
echo
echo

connect="autossh -M 0 -N -oStrictHostKeyChecking=no -p${JAMBOX_SSH_PORT} -R${JAMBOX_PORT}:localhost:${JAMMER_PORT} ${JAMBOX_USER}@${JAMBOX_HOST}"

socat tcp-listen:${JAMMER_PORT},fork tcp:host.docker.internal:22 &

while true; do
	echo $connect
	runuser -l user -c "$connect"
	sleep 60
done


