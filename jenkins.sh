#!/bin/bash

sudo yum install epel-release -y
sudo yum update -y
sudo yum install java-1.8.0-openjdk.x86_64 -y
sudo cp /etc/profile /etc/profile_backup
sudo echo 'export JAVA_HOME=/usr/lib/jvm/jre-1.8.0-openjdk' | sudo tee -a /etc/profile
sudo echo 'export JRE_HOME=/usr/lib/jvm/jre' | sudo tee -a /etc/profile
sudo source /etc/profile
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
yum install jenkins -y
sudo systemctl start jenkins.service
sudo systemctl enable jenkins.service
sudo yum install firewall-cmd -y
sudo systemctl start firewalld
sudo systemctl enable firewalld
sudo firewall-cmd --zone=public --permanent --add-port=8080/tcp
sudo firewall-cmd --reload
