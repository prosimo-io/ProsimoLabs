#! /bin/bash

## Install Docker-CE
sudo yum update -y
sudo yum install docker -y
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -a -G docker ec2-user

## Install docker-compose
sudo curl -SL https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

## Wallarm OSS API Firewall
cd /home/ec2-user/
sudo docker pull api-firewall:0.6.16

sudo docker run --rm -it \
  -v "./api_fw_spac.json:/opt/resources/api_fw_spac.json" -e APIFW_API_SPECS="/opt/resources/api_fw_spac.json" \
  -e APIFW_URL="http://0.0.0.0:8080" -e APIFW_SERVER_URL="http://10.100.1.100:3000" \
  -e APIFW_REQUEST_VALIDATION="BLOCK" -e APIFW_RESPONSE_VALIDATION="BLOCK" \
  -p 8088:8088 wallarm/api-firewall:v0.6.16



