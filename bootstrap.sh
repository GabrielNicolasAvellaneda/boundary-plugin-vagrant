#!/usr/bin/env bash 

GIT_USER_NAME="Your Git Username"
GIT_USER_EMAIL="your@email.com"
GIT_CORE_EDITOR=vim

BOUNDARY_API_TOKEN="api.4a188c9650-6506"

# Basic system configuration

if [[ $# -eq 0 || $1 = 'git' ]]
then
  sudo apt-get install -y git
  git config --global user.name $GIT_USER_NAME
  git config --global user.email $GIT_USER_EMAIL
  git config --global core.editor $GIT_CORE_EDITOR
fi

# Boundary meter installation
if [[ $# -eq 0 || $1 = "boundary" ]]
then
  curl -fsS \
    -d "{\"token\":\"$BOUNDARY_API_TOKEN\"}" \
    -H "Content-Type: application/json" \
    "https://meter.boundary.com/setup_meter" > setup_meter.sh
  chmod +x setup_meter.sh
  ./setup_meter.sh
  rm setup_meter.sh
fi

# Luachech installation 
if [[ $# -eq 0 || $1 = "luacheck" ]]
then
  sudo apt-get update
  sudo apt-get install -y luarocks
  sudo luarocks install luacheck
fi

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

