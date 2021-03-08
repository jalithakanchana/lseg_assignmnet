#! /bin/bash

now=`date +"%Y-%m-%d"`

echo "############upload to s3 bucket##########"
aws s3 cp logs_content.$now.tar.gz  s3://apache-webserver-logs/ --include "*.tar.gz"
if [ $? -eq 0 ]; then
  ssh ec2-user@54.208.106.0  sudo rm -rf  /home/ec2-user/*.tar.gz
else
  echo "s3 upload fails" | sudo ssmtp -vvv jalithakanchana@gmail.com
fi

