#! /bin/bash

now=`date +"%Y-%m-%d"`

echo "###########copy files to admin server########"
scp /home/ec2-user/logs_content.$now.tar.gz ec2-user@54.208.106.0:
