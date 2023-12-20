#! /bin/bash
sudo apt-get update
sudo apt-get install -y git

# install nodejs 21
sudo apt-get update && sudo apt-get install -y ca-certificates curl gnupg
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /usr/share/keyrings/nodesource.gpg
NODE_MAJOR=21
echo "deb [signed-by=/usr/share/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
sudo apt-get update && sudo apt-get install nodejs -y

node -e "console.log('Running Node.js ' + process.version)"

# Fetch NodesJS App
mkdir /home/linuxuser/prosimo-lab/
git clone https://github.com/prosimo-io/ProsimoLabs.git
## REMOVE
cd /home/linuxuser/ProsimoLabs
git checkout n8-updates
cp -r /home/linuxuser/ProsimoLabs/lab-servers /home/linuxuser/prosimo-lab/
##TODO: rm -rf /home/linuxuser/ProsimoLabs



## sudo apt-get install -y apache2
## sudo systemctl start apache2
## sudo systemctl enable apache2
## echo "<h1>Hello Prosimo MCN fans and Welcome</h1>" | sudo tee /var/www/html/index.html
## 
## sudo apt install iperf3 -y
## 
## %{ for port in server_ports ~}
## sudo bash -c 'cat <<"EOT" > /etc/systemd/system/iperf-server-${port}.service 
## [Unit]
## Description=iperf3 Server ${port}
## After=network.target
## 
## [Service]
## Type=simple
## Restart=on-failure
## RestartSec=1
## User=linuxuser
## ExecStart=/usr/bin/iperf3 -s -p ${port} 
## 
## [Install]
## WantedBy=multi-user.target
## EOT'
## %{ endfor ~}
## 
## 
## %{ for port in server_ports ~}
## sudo systemctl start iperf-server-${port}.service
## %{ endfor ~}
