#!/bin/bash

sudo apt-get update && sudo apt-get upgrade -y

sudo apt-get install apache2 -y

git clone https://github.com/amolshete/card-website.git

cp -rf card-website/* /var/www/html/