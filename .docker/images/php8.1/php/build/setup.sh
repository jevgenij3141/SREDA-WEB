#!/bin/bash

set -e

echo "Installing PHP 8.1"
DEBIAN_FRONTEND=noninteractive

apt-get update

apt-get install -y lsb-release ca-certificates apt-transport-https software-properties-common gnupg2

echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/sury-php.list

curl -fsSL  https://packages.sury.org/php/apt.gpg| gpg --dearmor -o /etc/apt/trusted.gpg.d/sury-keyring.gpg

apt-get update

apt-get install docker openssl -y

apt-get install libapache2-mod-php8.1 php8.1-ssh2 php8.1-mysql php8.1-gd php8.1-xdebug php8.1-curl php8.1-xml php8.1-mbstring php8.1-ldap php8.1-soap php8.1-xsl php8.1-mysqli php8.1-pdo-mysql php8.1-exif php8.1-gd php8.1-gettext php8.1-gmp php8.1-intl php8.1-imap -y
	
# php8.1-bcmath \
# php8.1-pspell aspell-en aspell-lt \
# zip unzip php8.1-zip \

rm -rf /var/lib/apt/lists/*

#a2enmod php8.1

echo "Adding XDEBUG .ini configuration"
cp /build/files/xdebug.ini /etc/php/8.1/apache2/conf.d/xdebug.custom.ini
cp /build/files/xdebug.ini /etc/php/8.1/cli/conf.d/xdebug.custom.ini

echo "Adding PHP configuration"
cp /build/files/php.ini /etc/php/8.1/apache2/conf.d/php.custom.ini