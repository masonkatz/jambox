#!/bin/bash

echo
echo
echo
figlet JamBox
echo
echo
echo

# jambox-config volume holds:
#
# Host ssh keys so we can bring the jambox up/down and not
# change identity on the jammer. This lets us only run the jambox when
# we need it (jammer will re-attach w/in a minute)
#
# User (only one) home directory, this is mainly for the ~/.ssh
# authorized_keys, but this also makes the jambox a usefull place to
# drop files and preserve after stopping the jambox.

CFGDIR=/config
for key in rsa ecdsa ed25519; do
	if [ ! -e $CFGDIR/ssh_host_${key}_key ]; then
		ssh-keygen -t $key -f $CFGDIR/ssh_host_${key}_key -N ''
	fi
	ln -s $CFGDIR/ssh_host_${key}_key     /etc/ssh/
	ln -s $CFGDIR/ssh_host_${key}_key.pub /etc/ssh/
done

if [ ! -e $CFGDIR/home ]; then
	mkdir $CFGDIR/home
fi
rm -rf /home
ln -s $CFGDIR/home /home


useradd $JAMBOX_USER
echo $JAMBOX_PASSWORD | passwd $JAMBOX_USER --stdin


/usr/sbin/sshd -D -e
