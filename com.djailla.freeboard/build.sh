#!/bin/bash

mkdir -m 755 -p /opt/freeboard/
install -m 755 /home/source/rc.local /etc
install -m 755 /home/source/freeboard.conf /etc/apache2/conf.d

# Add nodejs repo
apt-get update
apt-get install -y -q curl git
if [ $RAINBOW_ARCHITECTURE = "x86_64" ]
then
    # Install nodejs components
    curl -sL https://deb.nodesource.com/setup_5.x | bash -
    apt-get install -y -q nodejs npm
else
    echo "ARM"
fi

npm install -g grunt-cli

# Checkout sources in /opt
cd /opt/freeboard/
git clone https://github.com/Freeboard/freeboard.git

# Install the component
cd freeboard
npm install
grunt
mv * /var/www

#Cleanup env
apt-get autoremove -y -q curl git
apt-get clean

# FREEBOARD=/var/www/freeboard
# mkdir -m 755 -p $FREEBOARD
# mv * $FREEBOARD

# # Setup apache2
# chgrp -R www-data $FREEBOARD
# chmod -R g+w $FREEBOARD
# a2enmod rewrite

exit 0
