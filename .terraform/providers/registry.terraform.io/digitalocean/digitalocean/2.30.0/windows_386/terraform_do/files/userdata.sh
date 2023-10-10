#!/bin/bash
exec > /var/log/user-data.log 2>&1
echo "Starting user-data script..."

sleep 2m 30s

echo "Now after sleeping , Starting user-data script..."


yum update -y
yum install epel-release -y

yum install git -y
yum install nodejs -y
yum install npm -y

npm install pm2 -g


git clone https://github.com/simple-coding-2020/terraform-digitalocean-app app
cd app
npm install
pm2 start index.js