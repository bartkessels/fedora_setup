#!/bin/bash

# Display usage if both arguments aren't specified
if [ -z "$1" ] || [ -z "$2" ]; then
	echo "Usage: createvhost <project name>(.dev will be added) (/var/www/ will be added)<project location>"
	exit 1
fi

if [[ $EUID -ne 0 ]]; then
    echo 'This script must be run as root!'
    exit 0;
fi

project_name="$1"
project_location="$2"

# Copy vhost file
cp /home/bkessels/.config-files/apache_vhost.conf /etc/httpd/conf.d/$project_name.dev.conf

# Change variables config file
sed -i "s|\[\[project_name]]|$project_name|g" /etc/httpd/conf.d/$project_name.dev.conf
sed -i "s|\[\[project_location]]|$project_location|g" /etc/httpd/conf.d/$project_name.dev.conf

# Add hostname to /etc/hosts
printf "\n127.0.0.1 $project_name.dev" >> /etc/hosts

# Restart nginx
systemctl restart httpd

# Let user know everything is set up
echo "Your project $project_name is created!"
