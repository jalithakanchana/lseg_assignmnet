#! /bin/bash
echo "########### connecting to server ###########"

now=`date +"%Y-%m-%d"`

echo "###########copy the the content###########"
sudo cp /var/log/httpd/access_log /home/ec2-user/tmp/logs_content
sudo cp /var/log/httpd/error_log /home/ec2-user/tmp/logs_content
sudo cp -r /var/www/html/ /home/ec2-user/tmp/logs_content

echo "###########compress content###########"
sudo tar -zcvf  logs_content.$now.tar.gz  /home/ec2-user/tmp/logs_content
