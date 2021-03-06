#! /bin/bash
echo "########### check if Web server is running and start it if it is not and save results to the database ###########"


status_code=$(curl --write-out "%{http_code}\n" --silent --output /dev/null "http://localhost:80")
SERVICE="httpd"
TIMESTAMP=`date "+%Y-%m-%d %H:%M:%S"`

if pgrep -x "$SERVICE" >/dev/null
then
    echo "$SERVICE is running"
    service="running"
else
    echo "httpd service is not running" | sudo ssmtp -vvv jalithakanchana@gmail.com
    sudo  systemctl start httpd
    echo "$SERVICE started"
    service="stopped"
fi



mysql --host=rds-mysql.ca4tvqer9ldy.us-east-1.rds.amazonaws.com  --user=admin --password=admin1234 webserver1db << EOF
insert into  web_details (created_at,status,status_code) values('$TIMESTAMP','$service','$status_code');
EOF
