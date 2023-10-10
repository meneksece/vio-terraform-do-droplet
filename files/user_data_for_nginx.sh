#!/bin/bash

sleep 30

# Install Nginx
yum install -y epel-release
yum install -y nginx

# Start and enable the Nginx service
systemctl start nginx
systemctl enable nginx

# Create a basic HTML "Hello World!" file
echo '<html><body><h1>Hello World!</h1></body></html>' > /usr/share/nginx/html/index.html
