#!/bin/sh

# APACHE VIRTUAL HOSTS
#######################

# copy all virtual hosts
sudo cp /usr/local/vagrant/hosts/* /etc/apache2/sites-available/

# activate the default config & all PHP Versions
sudo a2ensite 00*.conf

# eisenkies.at
# -------------------
if [ -d "/var/www/my-domain.com/" ]; then
    sudo a2ensite 100-my-domain.conf
else
    sudo a2dissite 100-my-domain.conf
fi

# restart apache
sudo service apache2 restart
