#!/bin/bash

apt-get update&& \
apt-get -y install nano mc&& \
apt-get -y install python3&& \
ln -s /usr/bin/python3 /usr/bin/python&& \
ln -s /usr/bin/pip3 /usr/bin/pip&& \
apt-get -y install docker.io&& \
apt-get -y install docker-compose&& \
systemctl enable docker&& \
systemctl start docker
