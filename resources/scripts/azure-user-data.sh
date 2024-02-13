#! /bin/bash
sudo apt-get update
sudo apt-get install -y git

# install nodejs 20
sudo apt-get update && sudo apt-get install -y ca-certificates curl gnupg
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /usr/share/keyrings/nodesource.gpg
NODE_MAJOR=20
echo "deb [signed-by=/usr/share/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
sudo apt-get update && sudo apt-get install nodejs -y


# Fetch NodesJS App
mkdir /home/linuxuser/prosimo-lab/
sudo chown linuxuser:linuxuser /home/linuxuser/prosimo-lab/
cd /home/linuxuser
git clone https://github.com/prosimo-io/ProsimoLabs.git
## REMOVE
cd /home/linuxuser/ProsimoLabs
git checkout ${lab_version}
cp -r /home/linuxuser/ProsimoLabs/resources/lab-servers /home/linuxuser/prosimo-lab/
sudo chown -R linuxuser:linuxuser /home/linuxuser/prosimo-lab/
##TODO: rm -rf /home/linuxuser/ProsimoLabs
cd /home/linuxuser/prosimo-lab/lab-servers/middleware
npm install


# Create Systemd Unit for Traffic generator script, for each port.

sudo bash -c 'cat <<"EOT" > /etc/systemd/system/lab-api-server.service
[Unit]
Description=Prosimo Labs API Server
After=network.target

[Service]
Environment="PORT=3000"
Type=simple
Restart=on-failure
RestartSec=1
User=linuxuser
WorkingDirectory=/home/linuxuser/prosimo-lab/lab-servers/middleware
ExecStart=/usr/bin/node .

[Install]
WantedBy=multi-user.target
EOT'

sudo systemctl start lab-api-server.service
