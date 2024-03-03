#!/bin/sh

# APACHE VIRTUAL HOSTS
#######################

# activate the default config & all PHP Versions
sudo cp /usr/local/vagrant/hosts/00*.conf /etc/apache2/sites-available/
sudo a2ensite 00*.conf

# eisenkies.at
# -------------------
sudo cp /usr/local/vagrant/hosts/100-my-domain.conf /etc/apache2/sites-available/

if [ -d "/var/www/my-domain.com/" ]; then
    sudo a2ensite 100-my-domain.conf
else
    sudo a2dissite 100-my-domain.conf
fi

# restart apache
sudo service apache2 restart
