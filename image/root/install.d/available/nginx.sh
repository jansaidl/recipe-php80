#!/bin/bash

set -e

add-apt-repository ppa:ondrej/nginx

apt update
apt-get -y install nginx-extras


rm -f /etc/nginx/sites-enabled/default
rm -f /etc/nginx/sites-available/default
systemctl enable nginx.service

