#!/bin/sh

# ---------------------------------------------------------------------------------
# Elastic Search Setup
# ---------------------------------------------------------------------------------

sudo apt-get install openjdk-8-jdk
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-7.x.list
sudo apt-get update && sudo apt-get install elasticsearch

# Elastic Config:
# use this to make elasticsearch accesible from remote
# ---------------------------------------------------------------------------------
sudo su
vim /etc/elasticsearch/elasticsearch.yml

## Add / change this
transport.host: 127.0.0.1
network.host: 0.0.0.0
http.port: 9200

# Start / Stopn / status
# ----------------------------------------------------------------------------------
sudo service elasticsearch start
sudo service elasticsearch stop
sudo service elasticsearch status
