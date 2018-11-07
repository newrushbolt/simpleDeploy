#!/bin/bash

apt-get update&& \
apt-get install python3&& \
ln -s /usr/bin/python3 /usr/bin/python&& \
apt-get install docker.io&& \
systemctl enable docker&& \
systemctl start docker
