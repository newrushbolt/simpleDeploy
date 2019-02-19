#!/bin/bash

yum install -y \
	epel-release \
	https://centos7.iuscommunity.org/ius-release.rpm

yum update -y

yum install -y \
	curl \
	iftop \
	iotop \
	libselinux-python \
	lsof \
	net-tools \
	ntp \
	python2-pip \
	python36u \
	python36u-pip \
	rsync \
	strace \
	sysstat \
	tcpdump \
	telnet \
	traceroute \
	unzip \
	yum
