#!/usr/bin/env bash 

GIT_USER_NAME="Your Git Username"
GIT_USER_EMAIL="your@email.com"

# Basic system configuration
sudo apt-get install -y git
git config --global user.name $GIT_USER_NAME
git config --global user.email $GIT_USER_EMAIL
git config --global core.editor vim

# Luachech installation 
sudo apt-get update
sudo apt-get install -y luarocks
sudo luarocks install luacheck

# HAProxy
# TODO: Install latest verions of HAProxy for v1.3.x, v1.4.x, v1.5.x, v1.6.x

# TODO: Install Apache 2.2


# Zookeeper

# HBase

# Apache Storm

# Apache Tomcat

# TODO: Install OpenStack

# TODO: Install Nginx

# TODO: Install Varnish Cache

