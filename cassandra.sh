#!/bin/bash
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get -y update
sudo apt-get -y install default-jdk
echo deb http://www.apache.org/dist/cassandra/debian 311x main | sudo tee -a /etc/apt/sources.list.d/cassandra.list
curl https://www.apache.org/dist/cassandra/KEYS | sudo apt-key add -
sudo apt-get -y update
sudo apt-get -y install cassandra
sudo service cassandra start