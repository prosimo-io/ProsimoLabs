#! /bin/bash
sudo yum update -y && ## << Fixes 'Yum lock error'
sudo touch /home/ec2-user/USERDATA_EXECUTED
yum install -y httpd.x86_64
systemctl start httpd.service
systemctl enable httpd.service
echo “Hello Prosimo MCN fans and Welcome” > /var/www/html/index.html

cat <<"EOT" > /home/ec2-user/traffic.sh
#! /bin/bash
if [[ $# -ne 2 ]]; then
    echo "Illegal number of parameters. Usage: traffic.sh <count> <url>"
    exit 2
else
    COUNTER=0
    if [[ $1 == "test" ]]; then
    while [[  $COUNTER -lt 2 ]]; do
        let COUNTER=COUNTER+1
        echo The counter is $COUNTER of 2
        curl $2
        sleep 2
    done
    else
    while [[  $COUNTER -lt $1 ]]; do
        let COUNTER=COUNTER+1
        curl -s $2 > /dev/null
        sleep 5
    done
    exit 0
    fi
fi

EOT

sudo chmod u+x /home/ec2-user/traffic.sh
sudo chown ec2-user:ec2-user /home/ec2-user/traffic.sh
