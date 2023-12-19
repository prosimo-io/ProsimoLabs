#! /bin/bash
sudo apt-get update
sudo apt-get install -y git

sudo curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
sudo . ~/.nvm/nvm.sh
sudo nvm install --lts
node -e "console.log('Running Node.js ' + process.version)"

# Fetch NodesJS App
mkdir /home/azurelinux/prosimo-lab/
git clone https://github.com/prosimo-io/ProsimoLabs.git
## REMOVE
cd /home/azurelinux/ProsimoLabs
git checkout n8-updates
cp -r /home/azurelinux/ProsimoLabs/lab-servers /home/azurelinux/prosimo-lab/
##TODO: rm -rf /home/azurelinux/ProsimoLabs



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
