#!/usr/bin/env bash 

# This script accepts a parameter with the application/service to install/configure. for example ./bootstrap.sh git. If no parameter is specified it will install/configure all the applications/services.

# TODO:
# 	Interactive mode, ask for variables like GIT_USER_NAME, GIT_USER_EMAIL, GIT_CORE_EDITOR and show default values.

# Services and applications list:
# git
# boundary-meter 
# haproxy
# 	versions: 
# luacheck
# couchbase

GIT_USER_NAME="Your Git Username"
GIT_USER_EMAIL="your@email.com"
GIT_CORE_EDITOR=vim

BOUNDARY_API_TOKEN="api.xxxxxxxxxx-xxxx"

# Basic system configuration
sudo apt-get update

# JDK installation
sudo apt-get install -y default-jdk

if [[ $# -eq 0 || $1 = 'git' ]]
then
  sudo apt-get install -y git
  git config --global user.name $GIT_USER_NAME
  git config --global user.email $GIT_USER_EMAIL
  git config --global core.editor $GIT_CORE_EDITOR
fi

# Boundary meter installation
if [[ $# -eq 0 || $1 = "boundary-meter" ]]
then
  curl -fsS \
    -d "{\"token\":\"$BOUNDARY_API_TOKEN\"}" \
    -H "Content-Type: application/json" \
    "https://meter.boundary.com/setup_meter" > setup_meter.sh
  chmod +x setup_meter.sh
  ./setup_meter.sh
  rm setup_meter.sh
fi

# Clone repositories into working directory
mkdir -p /vagrant/boundary
cd /vagrant/boundary

git clone https://github.com/GabrielNicolasAvellaneda/boundary-plugin-couchbase
git clone https://github.com/GabrielNicolasAvellaneda/boundary-plugin-framework-lua

# Luacheck installation 
if [[ $# -eq 0 || $1 = "luacheck" ]]
then
  sudo apt-get install -y luarocks
  sudo luarocks install luacheck
fi

# HAProxy
# TODO: Install latest verions of HAProxy for v1.3.x, v1.4.x, v1.5.x, v1.6.x
if [[ $# -eq 0 || $1 = "haproxy" ]]
then
  sudo apt-get install -y haproxy
  sudo apt-get install -y libpcre3-dev

  mkdir -p /vagrant/haproxy
  cd /vagrant/haproxy
  wget http://www.haproxy.org/download/1.3/src/haproxy-1.3.27.tar.gz
  if [[ -f /vagrant/haproxy-1.3.27.tar.gz ]]
  then
    tar -zvzf haproxy-1.3.27.tar.gz
    cd haproxy-1.3.27
    make TARGET=linux26 USE_PCRE=1
# TODO: Create an script to run the haproxy ./haproxy -f /etc/haproxy/haproxy.cfg 
  fi
  cd /vagrant
fi

# ActiveMQ installation and configuration
if [[ $# -eq 0 || $1 = "activemq" ]]
then
  cd /vagrant/installers
  wget http://mirror.nbtelecom.com.br/apache/activemq/5.11.1/apache-activemq-5.11.1-bin.tar.gz
fi

# Install Apache 2.2
sudo apt-get install -y apache2

# Zookeeper

# HBase

# Apache Storm

# Apache Tomcat

# TODO: Install OpenStack

# TODO: Install Nginx

# TODO: Install Varnish Cache

# Install couchbase
if [[ $# -eq 0 || $1 = "couchbase" ]]
then
	cd /vagrant/installers
	wget http://packages.couchbase.com/releases/3.0.3/couchbase-server-enterprise_3.0.3-ubuntu12.04_amd64.deb
	sudo dpkg -i couchbase-server-enterprise_3.0.3-ubuntu12.04_amd64.deb
fi

