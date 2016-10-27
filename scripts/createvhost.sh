#!/bin/bash

project_name="$1"
project_location="$1"

# Copy vhost file
cp /home/bkessels/.config-files/nginx_vhost.conf /etc/nginx/conf.d/$project_name.dev.conf

# Change variables config file
sed -i "s/[[project_name]]/$project_name/g" /etc/nginx/conf.d/$project_name.dev.conf
sed -i "s/[[project_location]]/$project_location/g" /etc/nginx/conf.d/$project_name.dev.conf

# Add hostname to /etc/hosts
printf "127.0.0.1 $project_name.dev" >> /etc/hosts

# Restart nginx
systemctl restart nginx

# Let user know everything is set up
echo "Your project $project_name is created!"
