#! /bin/bash
sudo yum update -y && ## << Fixes 'Yum lock error'
sudo touch /home/ec2-user/USERDATA_EXECUTED
sudo yum install -y git

# Install NodeJS 20
sudo yum install https://rpm.nodesource.com/pub_20.x/nodistro/repo/nodesource-release-nodistro-1.noarch.rpm -y
sudo yum install nsolid -y

# Fetch NodesJS App
mkdir /home/ec2-user/prosimo-lab/
sudo chown ec2-user:ec2-user /home/ec2-user/prosimo-lab/
git clone https://github.com/prosimo-io/ProsimoLabs.git
## REMOVE
cd /home/ec2-user/ProsimoLabs
git checkout n8-updates
cp -r /home/ec2-user/ProsimoLabs/lab-servers /home/ec2-user/prosimo-lab/
sudo chown -R ec2-user:ec2-user /home/ec2-user/prosimo-lab/
##TODO: rm -rf /home/ec2-user/ProsimoLabs
cd /home/ec2-user/prosimo-lab/lab-servers/frontend
npm install

# Create Systemd Unit for Traffic generator script, for each port.

sudo bash -c 'cat <<"EOT" > /etc/systemd/system/lab-message-router.service
[Unit]
Description=Prosimo Labs Message Router
After=network.target

[Service]
Environment="UPSTREAM_API_ADDR=${upstream_host}"
Environment="UPSTREAM_API_PORT=${upstream_port}"
Environment="PORT=80"
Type=simple
Restart=on-failure
RestartSec=1
User=ec2-user
WorkingDirectory=/home/ec2-user/prosimo-lab/lab-servers/frontend
ExecStart=/usr/bin/node .

[Install]
WantedBy=multi-user.target
EOT'

sudo systemctl start lab-message-router.service
