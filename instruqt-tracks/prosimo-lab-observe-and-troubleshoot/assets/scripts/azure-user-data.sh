#! /bin/bash
sudo apt-get update
sudo apt-get install -y apache2
sudo systemctl start apache2
sudo systemctl enable apache2
echo "<h1>Hello Prosimo MCN fans and Welcome</h1>" | sudo tee /var/www/html/index.html

cat <<"EOT" > /home/linuxuser/traffic.sh
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

sudo chmod u+x /home/linuxuser/traffic.sh
sudo chown linuxuser:linuxuser traffic.sh