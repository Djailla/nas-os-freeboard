sed -i "s/NameVirtualHost \*\:80/NameVirtualHost \*/" /etc/apache2/ports.conf
sed -i "s/VirtualHost \*\:80/VirtualHost \*/" /etc/apache2/sites-enabled/000-default

sed -i "1i\Alias /$RAINBOW_WEB_PATH /var/www" /etc/apache2/conf.d/freeboard.conf
sed -i "s/Listen 80/Listen 127.0.0.1:$RAINBOW_PORT_WEB_UI/" /etc/apache2/ports.conf