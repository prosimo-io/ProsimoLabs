#! /bin/bash
sudo yum update -y && ## << Fixes 'Yum lock error'
sudo touch /home/ec2-user/USERDATA_EXECUTED
sudo yum install -y git

sudo yum install -y httpd.x86_64

TOKEN=$(curl --request PUT "http://169.254.169.254/latest/api/token" --header "X-aws-ec2-metadata-token-ttl-seconds: 3600")
PUBLIC_ADDR=$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4 --header "X-aws-ec2-metadata-token: $TOKEN")

cat <<EOT > /etc/httpd/conf.d/prosimo-lab.conf 
<VirtualHost *:80>
#      ServerName $${PUBLIC_ADDR}
#      ServerAlias www.$${PUBLIC_ADDR}
#      ServerAdmin webmaster@$${PUBLIC_ADDR}
 
      ProxyPreserveHost Off
      ProxyPass / http://localhost:3000/
      ProxyPassReverse / http://localhost:3000/
 
      ErrorLog /var/log/httpd/lab-error.log
      CustomLog /var/log/httpd/access.log combined
</VirtualHost>
EOT

# Install NodeJS 18
sudo dnf install nodejs -y

# Fetch NodesJS App
mkdir /home/ec2-user/prosimo-lab/
sudo chown ec2-user:ec2-user /home/ec2-user/prosimo-lab/
cd /home/ec2-user/
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
Environment="PORT=3000"
Type=simple
Restart=on-failure
RestartSec=1
User=ec2-user
WorkingDirectory=/home/ec2-user/prosimo-lab/lab-servers/frontend
ExecStart=/usr/bin/node .

[Install]
WantedBy=multi-user.target
EOT'

sudo systemctl daemon-reload
sudo systemctl start lab-message-router
sudo systemctl start httpd
