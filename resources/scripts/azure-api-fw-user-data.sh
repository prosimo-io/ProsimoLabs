#! /bin/bash
sudo apt-get update
sudo apt-get install -y git

# Install Docker
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"

sudo apt-get install docker-ce -y

###
#TODO: install docker-compose
# curl -SL https://github.com/docker/compose/releases/download/v2.24.6/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
# sudo curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo curl -SL https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose


## Wallarm OSS API Firewall
cd /home/linuxuser/
git clone https://github.com/wallarm/api-firewall.git
chown -R linuxuser:linuxuser /home/linuxuser/api-firewall/demo/docker-compose
cd api-firewall/demo/docker-compose
sudo docker-compose up -d --force-recreate
