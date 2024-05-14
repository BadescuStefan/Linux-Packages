#!/bin/bash

# Verify if the user is in root
if [ "$(id -u)" != "0" ]; then
    echo "This script needs to be run as root"
    exit 1
fi

# Update packages
apt update
apt update -y

# Installing the common packages for DevOps
apt install -y openssh-sever
apt install -y python python3
apt install -y git
apt install -y curl wget jq

# Installing Jenkins
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
apt update
apt install -y jenkins

# Installing Docker
apt install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt update
apt install -y docker-ce docker-ce-cli containerd.io

# Finalization
echo "The installation is completed. The common DevOps packages, Jenkins and Docker have been installed"
