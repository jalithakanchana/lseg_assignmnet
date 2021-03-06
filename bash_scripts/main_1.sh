#! /bin/bash

echo "########### Run check_webserver_content.sh script and check_webserver_status.sh script ###########"

ssh  ec2-user@54.234.202.204 'bash -s' < check_webserver_content.sh 
ssh  ec2-user@54.234.202.204 'bash -s' < check_webserver_status.sh
