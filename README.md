# Jambox

Jambox is a set of docker containers that makes it easy to setup your
own ssh-based vpn.

## Jambox

The jambox sits on your own private network, so you will need to
configure your router to port forward to the ssh daemon inside the
jambox. Jamboxes are more commonly known as jumpboxes.

## Jammer

The Jammer runs behind a firewall that you cannot control. It uses a
combination of autossh and socat to setup a tunnel from your jambox
all the way back to the docker host (not the container) ssh daemon.

Make sure you enable sshd on your host.

## Architecture

The following diagram spells this out. Note the end result is the data
flow from ssh on the "home server" to sshd on the "site server".

![alt tag](jambox.png)

## Setup

Generate a new jammer-specific ssh key for the jammer, you don't want
to use your own keys for this do you?

	$ ssh-keygen -t rsa -f ~/.ssh/jammer_rsa -N ''

Create an `env` file in this directory to describe the jambox host and
account. This files gets shared between both containers.

	JAMBOX_PASSWORD=<password>
	JAMBOX_HOST=<hostname>
	JAMBOX_SSH_PORT=22
	
See the docker-compose.yaml files for other environment variables that have
predefined defaults.

## Starting

### Jambox

#### Build

	cd jambox
	docker-compose build
	
#### Start

	cd jambox
	docker-compose up -d
	
### Jammer

#### Setup SSH

Copy the jammer public key into the jambox. You will be able to log in
using the $JAMBOX_PASSWORD set above. Once the keys are there it is
recommended to disable password-based logins into the jambox.

	source env
	ssh-copy-id -i ~/.ssh/jammer_rsa -p$JAMBOX_SSH_PORT user@$JAMBOX_HOST

#### Build

	cd jammer
	docker-compose build

#### Start

	cd jammer
	docker-compose up -d

## Using

From your home server you can ssh directly to the jambox as the
JAMBOX_USER (default=jam) on port JAMBOX_IN1 (default=2222). But, you
can also connect on port JAMBOX_IN3 (default=2200) and this will route
all the way back to your site site.

The jambox also exposed port 3128 to be used as a webproxy.


