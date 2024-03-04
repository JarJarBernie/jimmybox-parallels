![alt tag](https://raw.githubusercontent.com/JarJarBernie/jimmybox/master/public/src/jimmybox.png)

# jimmybox ARM64 Parallels 1.0: web developer box with multiple PHP versions
vagrant box for PHP Developers on Apple Silicon (M1, M2, M3). Works with Shopware and many other applications and frameworks such as Magento, Oxid 6.x, Wordpress, Typo3 or Laravel.

## Quick Setup:
1) Get the latest Versions of Vagrant, Parallels Desktop and Virtual Box

2) clone the latest version and run vagrant up
```bash
vagrant plugin install vagrant-parallels
mkdir -p ~/Vagrant/jimmy
cd ~/Vagrant/jimmy
git clone https://github.com/JarJarBernie/jimmybox-parallels .
vagrant up
```

3) open **192.168.33.20** in your browser (default PHP Version is 8.1)

(IP can be changed in your Vagrantfile, the "public" directory is your document root)

## Features
- Ubuntu 22.04 LTS
- Apache 2.4 with HTTP/2
- PHP 8.2 FPM
- PHP 8.1 FPM
- PHP 8.0 FPM
- PHP 7.4 FPM
- MariaDB 10.6
- APCu
- Redis
- Memcached
- Vim
- Git
- cURL
- GD and Imagick
- imagick-php
- Composer 2.x
- Mcrypt

## MySQL Access

- Hostname: localhost or 127.0.0.1
- Username: root
- Password: root

## Switching PHP-Versions:

Jimmybox comes with preconfigured virtual hosts to use multiple PHP Versions from 5.6 to 8.1. Please just edit your local hosts file to use different PHP Versions.

#### Prepare your hosts file

```bash
# PHP 8.2
192.168.33.20  jimmy82.com

# PHP 8.1
192.168.33.20  jimmy81.com

# PHP 8.0
192.168.33.20  jimmy80.com

# PHP 7.4
192.168.33.20  jimmy74.com

#### open Jimmybox in your browser
- PHP 8.2: http://jimmy82.com
- PHP 8.1: http://jimmy81.com
- PHP 8.0: http://jimmy80.com
- PHP 7.4: http://jimmy74.com

## Provisioning & custom hosts setup
You can use our provisioning template to setup your custom hosts.

1. place your hosts.conf files in povisioning/hosts/ and edit them regarding to your needs
2. open provisioning/setup/apache.sh and add code to enable/disable your custom hosts. This will ensure that your hosts only will be enabled if the directory exists.
3. if needed, copy your SSL certs to provisioning/ssl/ and link it in your custom hosts config file
4. restart vagrant with the provisioning flag and your vhosts will get enabled if the vhosts dir exists.

````nashorn js
vagrant reload --provision
````

### Switching PHP Versions in your custom hosts

Please include the following SetHandler directives in your custom vhost as seen in provisioning/hosts/100-myproject.conf.
After that, you can simply uncomment the requested line and reload your apache config (sudo service apache2 reload)

```
<FilesMatch \.php>
        SetHandler "proxy:unix:/var/run/php/php8.2-fpm.sock|fcgi://localhost/"
        # SetHandler "proxy:unix:/var/run/php/php8.1-fpm.sock|fcgi://localhost/"
        # SetHandler "proxy:unix:/var/run/php/php8.0-fpm.sock|fcgi://localhost/"
        # SetHandler "proxy:unix:/var/run/php/php7.4-fpm.sock|fcgi://localhost/"
        # SetHandler "proxy:unix:/var/run/php/php7.3-fpm.sock|fcgi://localhost/"
        # SetHandler "proxy:unix:/var/run/php/php7.2-fpm.sock|fcgi://localhost/"
        # SetHandler "proxy:unix:/var/run/php/php7.1-fpm.sock|fcgi://localhost/"
        # SetHandler "proxy:unix:/var/run/php/php7.0-fpm.sock|fcgi://localhost/"
        # SetHandler "proxy:unix:/var/run/php/php5.6-fpm.sock|fcgi://localhost/"
</FilesMatch>
```
### Setup Jimmybox shell extensions
cd ~/Vagrant/jimmy/public/sh &&  sh setup.sh

-----

# Known issues & fixes

## Error: Authentication failure. Retrying...

- break the vagrant process with CTRL+C
- run "vagrant ssh"
- password: vagrant

then copy the public key content from https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub to the authorised_keys file with the following command

```
echo "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vagrant insecure public key" > .ssh/authorized_keys
```
