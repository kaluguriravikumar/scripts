
#!/bin/bash

### This script will setup website from tooplate.com

# Managing Service httpd
echo "Installing dependencies."
yum install httpd wget unzip -y
echo
echo

echo "Start & Enable service."
systemctl start httpd
systemctl enable httpd

# Deploying artifacts
echo "Downloading artifact from tooplate.com"
mkdir -p /tmp/webfiles
cd /tmp/webfiles/
wget https://www.tooplate.com/zip-templates/2121_wave_cafe.zip

echo "Unarchive.............."
unzip -o 2121_wave_cafe.zip

echo "Copyiing files to server directory"
cp -r 2121_wave_cafe/* /var/www/html/

echo "Restart service"
systemctl restart httpd
rm -rf /tmp/webfiles

echo
echo
echo "Deployment completed successfully."
