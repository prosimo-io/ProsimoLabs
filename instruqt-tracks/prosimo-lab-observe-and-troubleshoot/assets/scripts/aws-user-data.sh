#! /bin/bash
sudo yum update -y && ## << Fixes 'Yum lock error'
sudo touch /home/ec2-user/USERDATA_EXECUTED
yum install -y git node
#yum install -y httpd.x86_64
#systemctl start httpd.service
#systemctl enable httpd.service
#echo “Hello Prosimo MCN fans and Welcome” > /var/www/html/index.html

#Install NVM/Node
sudo curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
sudo . ~/.nvm/nvm.sh
sudo nvm install --lts
node -e "console.log('Running Node.js ' + process.version)"

# Fetch NodesJS App
mkdir /home/ec2-user/prosimo-lab/
git clone https://github.com/prosimo-io/ProsimoLabs.git
## REMOVE
cd /home/ec2-user/ProsimoLabs
git checkout n8-updates
cp -r /home/ec2-user/ProsimoLabs/lab-servers /home/ec2-user/prosimo-lab/
##TODO: rm -rf /home/ec2-user/ProsimoLabs

# Create Traffic generator script for each port.

## %{ for port in upstream_ports ~}
## sudo bash -c 'cat <<"EOT" > /home/ec2-user/iperf-client-${port}.sh
## #!/bin/bash
## 
## while true; do
## 
##     # Run for default of 10 seconds
##     /usr/bin/iperf3 -c ${upstream_host} -p ${port} --logfile /home/ec2-user/iperf-client-${port}.log --verbose
## 
##     # Sleep for 60
##     sleep 60
## 
## done
## EOT'
## 
## sudo chmod +x /home/ec2-user/iperf-client-${port}.sh
## sudo chown ec2-user:ec2-user /home/ec2-user/iperf-client-${port}.sh
## 
## %{ endfor ~}

sudo bash -c 'cat <<"EOT" > /home/ec2-user/http-client-${upstream_host}.sh
#!/bin/bash

while true; do

    /usr/bin/curl http://${upstream_host}

    sleep 60

done
EOT'

sudo chmod +x /home/ec2-user/http-client-${upstream_host}.sh
sudo chown ec2-user:ec2-user /home/ec2-user/http-client-${upstream_host}.sh

nohup /home/ec2-user/http-client-${upstream_host}.sh &

# Create Systemd Unit for Traffic generator script, for each port.

## %{ for port in upstream_ports ~}
## sudo bash -c 'cat <<"EOT" > /etc/systemd/system/iperf-client-${port}.service
## [Unit]
## Description=iperf3 Client ${port}
## After=network.target
## 
## [Service]
## Type=simple
## Restart=on-failure
## RestartSec=1
## # RemainAfterExit=yes
## User=ec2-user
## ExecStart=/home/ec2-user/iperf-client-${port}.sh
## 
## [Install]
## WantedBy=multi-user.target
## EOT'
## %{ endfor ~}


## %{ for port in upstream_ports ~}
## sudo systemctl start iperf-client-${port}.service
## %{ endfor ~}