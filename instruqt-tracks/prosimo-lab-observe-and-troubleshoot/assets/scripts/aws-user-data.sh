#! /bin/bash
sudo yum update -y && ## << Fixes 'Yum lock error'
sudo touch /home/ec2-user/USERDATA_EXECUTED
yum install -y httpd.x86_64
systemctl start httpd.service
systemctl enable httpd.service
echo “Hello Prosimo MCN fans and Welcome” > /var/www/html/index.html

sudo yum -y install iperf3

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
ExecStart=/usr/bin/iperf3 -c ${upstream_host} -p ${port} -t 14400

[Install]
WantedBy=multi-user.target
EOT'
%{ endfor ~}


%{ for port in upstream_ports ~}
sudo systemctl start iperf-client-${port}.service
%{ endfor ~}