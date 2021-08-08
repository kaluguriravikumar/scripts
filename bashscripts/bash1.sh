#!/bin/bash

### This script will setup website from tooplate.com
DEP="httpd wget unzip"
SVC='httpd'
TEMPDIR="/tmp/webfiles"
WEBURL='https://www.tooplate.com/zip-templates/2113_earth.zip'
ARTNAME='2113_earth'

echo "Starting deployment at"
date
# Managing Service httpd
echo "Installing dependencies."
yum install $DEP -y >> /dev/null
echo
echo

echo "Start & Enable service."
systemctl start $SVC
systemctl enable $SVC

# Deploying artifacts
echo "Downloading artifact from tooplate.com"
mkdir -p $TEMPDIR
cd $TEMPDIR
wget $WEBURL >> /dev/null

echo "Unarchive.............."
unzip -o $ARTNAME.zip >> /dev/null

echo "Copyiing files to server directory"
cp -r $ARTNAME/* /var/www/html/

echo "Restart service"
systemctl restart $SVC
rm -rf $TEMPDIR

echo
echo
echo "Deployment completed successfully."
date
