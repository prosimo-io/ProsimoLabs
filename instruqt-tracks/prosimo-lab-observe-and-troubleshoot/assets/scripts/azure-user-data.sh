#! /bin/bash
sudo apt-get update
sudo apt-get install -y apache2
sudo systemctl start apache2
sudo systemctl enable apache2
echo "<h1>Hello Prosimo MCN fans and Welcome</h1>" | sudo tee /var/www/html/index.html

sudo apt install iperf3 -y

%{ for port in server_ports ~}
sudo bash -c 'cat <<"EOT" > /etc/systemd/system/iperf-server-${port}.service
[Unit]
Description=iperf3 Server ${port}
After=network.target

[Service]
Type=simple
Restart=on-failure
RestartSec=1
RemainAfterExit=yes
User=linuxuser
ExecStart=/usr/bin/iperf3 -s -D -p ${port}

[Install]
WantedBy=multi-user.target
EOT'
%{ endfor ~}


%{ for port in server_ports ~}
sudo systemctl start iperf-server-${port}.service
%{ endfor ~}
