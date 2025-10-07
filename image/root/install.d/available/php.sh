#!/bin/bash

set -e

add-apt-repository ppa:ondrej/php
apt update
apt-get -y install \
php{{.Version}}-phar \
php{{.Version}}-fpm \
php{{.Version}}-bcmath \
php{{.Version}}-curl \
php{{.Version}}-gd \
php{{.Version}}-gmp \
php{{.Version}}-imagick \
php{{.Version}}-imap \
php{{.Version}}-intl \
php{{.Version}}-ldap \
php{{.Version}}-mbstring \
php{{.Version}}-mongo \
php{{.Version}}-mysql \
php{{.Version}}-opcache \
php{{.Version}}-pgsql \
php{{.Version}}-readline \
php{{.Version}}-redis \
php{{.Version}}-soap \
php{{.Version}}-sqlite3 \
php{{.Version}}-tidy \
php{{.Version}}-xml \
php{{.Version}}-zip \
openssl \
php-dev \
build-essential \

systemctl disable php{{.Version}}-fpm.service
systemctl mask php{{.Version}}-fpm.service

ln -s /etc/php/current /etc/php/{{.Version}}

wget -O composer-setup.php https://getcomposer.org/installer
php composer-setup.php
rm composer-setup.php
mv composer.phar /usr/local/bin/composer

apt-get clean;
rm -rf /var/lib/apt/lists/*
