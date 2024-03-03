#!/bin/sh

sudo usermod -a -G www-data vagrant

sudo apt-get update
sudo apt-get upgrade
sudo apt-get install software-properties-common
sudo add-apt-repository -y ppa:ondrej/php && sudo apt-get update
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4F4EA0AAE5267A6C && sudo apt-get update
sudo apt-get upgrade

sudo apt-get -y install vim wget git apache2 openssl libapache2-mod-fcgid pwgen zip unzip curl redis imagemagick

#mysql 8
#wget https://dev.mysql.com/get/mysql-apt-config_0.8.12-1_all.deb
#sudo dpkg -i mysql-apt-config_0.8.12-1_all.deb

# mysql 5.7
#sudo apt-get install mysql-server

# reset mysql root password
#sudo mysql
#ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root';
#FLUSH PRIVILEGES;
#exit

# disable mysql safe mode
#cd /etc/mysql/mysql.conf.d
#sudo vim disable_safe_mode.cnf

######################
[mysqld]
sql_mode=IGNORE_SPACE,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION
max_allowed_packet=1024M
#######################

# mariadb
sudo apt-get install mariadb-server
sudo mariadb-secure-installation

sudo mariadb
ALTER USER 'root'@'localhost' IDENTIFIED BY 'root';
FLUSH PRIVILEGES;

sudo /etc/init.d/mysqld restart

# Apache
sudo a2enmod rewrite ssl proxy_fcgi setenvif deflate
sudo service apache2 restart

# Resize disk
# 1. resize disk in Parallels
# 2. resize partition in Ubuntu
sudo fdisk -l

# 2. resize partition
pvresize /dev/sda3
( lvresize -l +100%FREE /dev/mapper/ubuntu--vg-ubuntu--lv )
lvextend --resizefs -l +100%FREE /dev/mapper/ubuntu--vg-ubuntu--lv
