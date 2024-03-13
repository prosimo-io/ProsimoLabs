#! /bin/bash
sudo apt-get update
sudo apt-get install -y git

## Install Docker-CE
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt-get install docker-ce -y

## Install docker-compose
sudo curl -SL https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

## Wallarm OSS API Firewall
cd /home/linuxuser/
# git clone https://github.com/wallarm/api-firewall.git
# chown -R linuxuser:linuxuser /home/linuxuser/api-firewall/demo/docker-compose
# cd api-firewall/demo/docker-compose
# sudo docker-compose up -d --force-recreate

sudo docker pull api-firewall:0.6.16

sudo docker run --rm -it \
  -v "./api_fw_spac.json:/opt/resources/api_fw_spac.json" -e APIFW_API_SPECS="/opt/resources/api_fw_spac.json" \
  -e APIFW_URL="http://0.0.0.0:8080" -e APIFW_SERVER_URL="http://10.100.1.100:3000" \
  -e APIFW_REQUEST_VALIDATION="BLOCK" -e APIFW_RESPONSE_VALIDATION="BLOCK" \
  -p 8088:8088 wallarm/api-firewall:v0.6.16



