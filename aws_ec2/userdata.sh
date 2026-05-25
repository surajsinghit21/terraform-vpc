#!/bin/bash

sudo apt-get update -y
sudo apt-get install -y apache2 git

# Get IMDSv2 token
TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" \
-H "X-aws-ec2-metadata-token-ttl-seconds: 21600" -s)

# Fetch metadata using token
META_INST_ID=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" -s \
http://169.254.169.254/latest/meta-data/instance-id)

META_INST_TYPE=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" -s \
http://169.254.169.254/latest/meta-data/instance-type)

META_INST_AZ=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" -s \
http://169.254.169.254/latest/meta-data/placement/availability-zone)

# Create webpage
sudo tee /var/www/html/index.html > /dev/null <<HTML
<!DOCTYPE html>
<html>
<head>
    <title>EC2 Instance Details</title>
</head>
<body>
    <h1>Your EC2 Instance is Running!</h1>

    <h2>Instance Details</h2>

    <p><b>Instance ID:</b> $META_INST_ID</p>
    <p><b>Instance Type:</b> $META_INST_TYPE</p>
    <p><b>Availability Zone:</b> $META_INST_AZ</p>
</body>
</html>
HTML

sudo systemctl start apache2
sudo systemctl enable apache2
