#!/bin/bash

set -e

DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get -y install curl vim apache2 libapache2-mod-wsgi-py3

a2enmod rewrite ssl headers

#echo "Create sds2, mks, mas, gmu2 folder"
#mkdir /var/www/sds2

echo "Setting up SSL"
mkdir /etc/apache2/ssl
cp /build/files/apache.crt /etc/apache2/ssl/apache.crt
cp /build/files/apache.key /etc/apache2/ssl/apache.key

echo "Setting up Europe/Vilnius timezone"
echo "Europe/Vilnius" > /etc/timezone
dpkg-reconfigure -f noninteractive tzdata

echo "Adding Apache configuration"

cp /build/files/sreda.conf /etc/apache2/sites-available
ln -s /etc/apache2/sites-available/sreda.conf /etc/apache2/sites-enabled/sreda.conf

ln -s /etc/apache2/mods-available/allowmethods.load /etc/apache2/mods-enabled/allowmethods.load
ln -s /etc/apache2/mods-available/ldap.load /etc/apache2/mods-enabled/ldap.load
ln -s /etc/apache2/mods-available/ldap.conf /etc/apache2/mods-enabled/ldap.conf

echo "Performing cleanup"
rm -rf /var/lib/apt/lists/*
rm -rf /var/www/*
rm /etc/apache2/sites-enabled/000-default.conf