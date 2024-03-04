# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  # config.vm.box = "sternpunkt/ubuntu2204_arm64_minimal"
  config.vm.box = "sternpunkt/jimmybox-arm64"

  # parallels
 config.vm.provider "parallels" do |v|
       v.memory = 4000
       v.cpus = 2
       v.linked_clone = true
       v.update_guest_tools = true
     end

# Disable automatic box update checking. If you disable this, then
# boxes will only be checked for updates when the user runs
# `vagrant box outdated`. This is not recommended.
# config.vm.box_check_update = false

# NETWORKING
  ############################################################################

  config.vm.hostname = "jimmy"

  # Private Network
  config.vm.network "private_network", ip: "192.168.33.20"

  # port forwarding must be enabled for vagrant share
  config.vm.network "forwarded_port", guest: 80, host: 8080, auto_correct: true

  # Public network:
  # uncomment the lines and add your own config (bridge, ip, etc.)

  # config.vm.network "public_network",
  # :bridge => "en0: WLAN (Airport)",
  # ip: "192.168.10.201", :netmask => "255.255.255.0", auto_config: true

  # SYNCED FOLDERS
  ############################################################################

  # DEFAULT:
  config.vm.synced_folder "~/Sites", "/var/www", owner: "www-data", group: "www-data"
  #config.vm.synced_folder "~/Sites", "/var/www"

  # NFS:
  # you should try NFS share - it performs much better than the default synced folder!
  # config.vm.synced_folder "/Volumes/Macintosh HD/Users/{Your-User}/Sites", "/var/www", type: 'nfs', mount_options: ['rw', 'vers=3', 'tcp', 'fsc' ,'actimeo=1']

  # RSYNC:
  # if you are using a framework that contains many files rsync can provide best performance
  # You can use vagrant rsync-auto to sync changes automatically to your vagrant box.
  #config.vm.synced_folder "/Volumes/Macintosh HD/Users/{Your-User}/Sites", "/var/www", type: "rsync", rsync__auto: true

  # PROVISIONERS
  ############################################################################

  # prepare the host
  # config.vm.provision "shell", inline: "sudo rm -rf /usr/local/vagrant && sudo mkdir /usr/local/vagrant/ && sudo chmod -R 777 /usr/local/vagrant"

  # Virtual Hosts
  config.vm.provision "file", source: "./public/provisioning/hosts", destination: "/usr/local/vagrant/"

  # SSL Certificates
  config.vm.provision "file", source: "./public/provisioning/ssl", destination: "/usr/local/vagrant/"

  # php.ini files
  config.vm.provision "file", source: "./public/provisioning/php.ini", destination: "/usr/local/vagrant/"

  # Execute Updates
  # config.vm.provision "shell", path: "./public/provisioning/setup/updates.sh"

  # Execute the apache setup scripts
  config.vm.provision "shell", path: "./public/provisioning/setup/apache.sh"

  # php.ini files
  # config.vm.provision "shell", path: "./public/provisioning/setup/php.sh"

  # perl prepare
  # config.vm.provision "shell", path: "./public/provisioning/setup/perl.sh"

  # start elastic
   #config.vm.provision "shell", path: "./public/provisioning/bootstrap/elastic.sh", run: "always"
end
