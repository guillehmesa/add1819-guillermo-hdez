#!/usr/bin/env bash

apt-get update
apt-get install -y apache2
rm -rf /var/www
ln -fs /vagrant /var/www
mkdir /var/www/html
echo "<h1>Vagrant Proyecto 3</h1>" > /var/www/index.html
echo "<p>Curso201819</p>" >> /var/www/index.html
echo "<p>Guillermo Hernández Mesa</p>" >> /var/www/index.html
mv /var/www/index.html /var/www/html
