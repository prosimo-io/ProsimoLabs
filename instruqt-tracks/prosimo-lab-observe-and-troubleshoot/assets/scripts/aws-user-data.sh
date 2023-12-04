#! /bin/bash
sudo yum update -y && ## << Fixes 'Yum lock error'
sudo touch /home/ec2-user/USERDATA_EXECUTED
yum install -y httpd.x86_64
systemctl start httpd.service
systemctl enable httpd.service
echo “Hello Prosimo MCN fans and Welcome” > /var/www/html/index.html

sudo yum -y install iperf3


# Create Traffic generator script for each port.

%{ for port in upstream_ports ~}
sudo bash -c 'cat <<"EOT" > /home/ec2-user/iperf-client-${port}.sh
#!/bin/bash

while true; do

    # Run for default of 10 seconds
    /usr/bin/iperf3 -c ${upstream_host} -p ${port} -t 30 --logfile /home/ec2-user/iperf-client-${port}.log --verbose

    # Sleep for 35 seconds
    sleep 35

done
EOT'
%{ endfor ~}

sudo chmod +x /home/ec2-user/iperf-client-${port}.sh
sudo chown ec2-user:ec2-user /home/ec2-user/iperf-client-${port}.sh


# Create Systemd Unit for Traffic generator script, for each port.

%{ for port in upstream_ports ~}
sudo bash -c 'cat <<"EOT" > /etc/systemd/system/iperf-client-${port}.service
[Unit]
Description=iperf3 Client ${port}
After=network.target

[Service]
Type=simple
Restart=on-failure
RestartSec=1
RemainAfterExit=yes
User=ec2-user
ExecStart=/home/ec2-user/iperf-client-${port}.sh

[Install]
WantedBy=multi-user.target
EOT'
%{ endfor ~}


%{ for port in upstream_ports ~}
sudo systemctl start iperf-client-${port}.service
%{ endfor ~}