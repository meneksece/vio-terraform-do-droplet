#!/bin/bash

exec > /var/log/user-data.log 2>&1
echo "Starting user-data script..."

sleep 30

# Install Docker
yum update -y
yum install epel-release -y
yum install -y docker

# Start and enable the Docker service
systemctl start docker
systemctl enable docker

# Create a Dockerfile for custom Nginx configuration
cat <<EOF > /tmp/Dockerfile
FROM nginx
COPY index.html /usr/share/nginx/html
EOF

# Create a simple "Hello World!" HTML file
echo '<html><body><h1>Hello World!</h1></body></html>' > /tmp/index.html

# Build a custom Nginx Docker image
docker build -t my-nginx /tmp -f /tmp/Dockerfile

# Run the custom Nginx Docker container
docker run -d -p 80:80 --name my-nginx-container my-nginx