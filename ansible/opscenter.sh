!/bin/bash
sudo touch /etc/yum.repos.d/datastax.repo
sudo chmod 777 /etc/yum.repos.d/datastax.repo 
sudo echo [opscenter] >> /etc/yum.repos.d/datastax.repo
sudo echo name = DataStax Repository >> /etc/yum.repos.d/datastax.repo
sudo echo baseurl = http://rpm.datastax.com/community >> /etc/yum.repos.d/datastax.repo
sudo echo enabled = 1 >> /etc/yum.repos.d/datastax.repo
sudo echo gpgcheck = 0 >> /etc/yum.repos.d/datastax.repo
sudo yum -y install opscenter
sudo chmod 777 /etc/opscenter/opscenterd.conf
sudo sed -i 's/False/True/g' /etc/opscenter/opscenterd.conf
sudo echo passwd_db = <path to passwd_db> >> /etc/opscenter/opscenterd.conf
sudo service opscenterd start
sudo service opscenterd restart
