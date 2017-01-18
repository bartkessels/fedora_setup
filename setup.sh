#!/bin/bash

#####################################################################################
#####################################################################################

#		VARIABELS

#####################################################################################
#####################################################################################

user_name='bkessels'
full_name=$(getent passwd $user_name | cut -d: -f5 | cut -d, -f1)
home=/home/$user_name
sync_folder=$home/bk-cloud

# Export for apm package installation
export USER=$user_name
export HOME=$home

#####################################################################################
#####################################################################################

#		MANAGE FOLDERS

#####################################################################################
#####################################################################################

rmdir $home/Documents
rmdir $home/Downloads
rmdir $home/Music
rmdir $home/Pictures
rmdir $home/Videos

mkdir $home/Git-projects
mkdir $home/Webserver

ln -sf $sync_folder/Documenten $home/Documents
ln -sf $sync_folder/Muziek $home/Music
ln -sf $sync_folder/Afbeeldingen $home/Pictures
ln -sf $sync_folder/Videos $home/Videos
ln -sf $sync_folder/Backups $home/Backups
ln -sf $sync_folder/Boeken $home/Books
ln -sf $sync_folder/ISOs $home/ISOs
ln -sf $sync_folder/Notities $home/Notes
ln -sf $sync_folder/School $home/School
ln -sf $sync_folder/Software $home/Software
ln -sf $sync_folder/Tabs $home/Tabs
ln -sf $sync_folder/Werk $home/Work

#####################################################################################
#####################################################################################

#		REPOS

#####################################################################################
#####################################################################################

# Install fedy for repos
wget -O fedy-installer http://folkswithhats.org/fedy-installer
chmod +x fedy-installer
./fedy-installer
rm fedy-installer

# Enable copr repos
dnf copr -y enable heikoada/gtk-themes
dnf copr -y enable rommon/telegram
dnf copr -y enable abn/ghostwriter

# Update
dnf update -y

#####################################################################################
#####################################################################################

#		SETTINGS

#####################################################################################
#####################################################################################

# VirtualBox
printf 'vboxdrv' > /etc/modules-load.d/virtualbox.conf

# Settings GUI tools
dnf install -y dconf-editor gnome-tweak-tool firewall-config

# Fonts
dnf install -y bitstream-vera-fonts-common linux-libertine-fonts-common google-noto-fonts-common google-noto-emoji-fonts google-android-emoji-fonts open-sans-fonts
ln -s /etc/fonts/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d

# Codecs
dnf install -y fedy-multimedia-codecs

# Archive formats
dnf install -y cabextract lzip p7zip p7zip-plugins unrar

# Themes / Icons / Cursors
dnf install -y paper-gtk-theme
dnf install -y paper-icon-theme

dnf install -y breeze-cursor-theme

# Shell / Plugins
dnf install -y zsh
usermod -s /bin/zsh $user_name

git clone https://github.com/robbyrussell/oh-my-zsh.git $home/.oh-my-zsh

# Inotify
printf '# Increase inofity watch limit\nfs.inotify.max_user_watches = 100000000' > /etc/sysctl.d/90-inotify.conf
printf '\n\n# Increase inofity watch limit\nfs.inotify.max_user_watches = 100000000' >> /usr/lib/sysctl.d/50-default.conf

# Git
echo 'What is your GIT e-mail address?'
read git_mail

printf "[user]\nemail='$git_mail'\nname='$full_name'\n[diff]\ntool=meld\n[push]\ndefault=simple" > $home/.gitconfig

# Sudoers file
printf '\nDefaults env_reset,insults\n' >> /etc/sudoers

# Audio
printf '* hard rtprio 0\n* soft rtprio 0\n@realtime hard rtprio 20\n@realtime soft rtprio 10\n@audio - rtprio 95\n@audio - memlock unlimited' >> /etc/security/limits.conf

# Create groups
groupadd realtime

# Hostname
hostnamectl set-hostname --static "BKlaptop"

#####################################################################################
#####################################################################################

#		SOFTWARE

#####################################################################################
#####################################################################################

# Utilities
dnf install -y whois pandoc deja-dup grsync gpick pdfmod gnome-todo luckybackup ghostwriter ffmpeg

# Nautilus extension
dnf install -y seahorse-nautilus gnome-terminal-nautilus

# LaTeX Editors / Packages
dnf install -y gummi latexila
dnf install -y texlive-crossreference texlive-upquote

# Audio Editors / Players
dnf install -y audacity ardour5
dnf install -y clementine

# Image Editors
dnf install -y gimp

# Video Editors / Recorders / Libs
dnf install -y blender pitivi
dnf install -y simplescreenrecorder
dnf install -y libdvdcss

# Development Editors / Editor Plugins / Development Kits / Tools / Libraries / Atom / Atom Packages
dnf install -y vim gnome-builder glade
dnf install -y vim-nerdtree
dnf install -y java-1.8.0-openjdk-devel automake autoconf zlib-devel.i686 ncurses-devel.i686 ant gettext-devel autoconf-archive
dnf install -y dia meld sqlitebrowser pencil planner gitg
dnf install -y gtk+-devel gtk3-devel libsoup-devel zlib.i686 ncurses-libs.i686 bzip2-libs.i686

wget -O atom.rpm https://atom.io/download/rpm
dnf install -y atom.rpm
rm atom.rpm

apm install atom-material-ui atom-material-syntax file-icons language-blade blade-snippets minimap docblock-format-helper

# Browsers / Web / Chat / Chrome
dnf install -y epiphany
dnf install -y filezilla transmission youtube-dl offlineimap
dnf install -y telegram-desktop

rpm --import https://dl-ssl.google.com/linux/linux_signing_key.pub
dnf install -y https://dl.google.com/linux/direct/google-chrome-stable_current_$(uname -i).rpm

# Office
dnf install -y aspell-nl libreoffice-langpack-nl gnome-calendar

# Virtualization
dnf install -y VirtualBox

# Password Management
dnf install -y keepassx

# Other
dnf install -y tuxguitar brasero

#####################################################################################
#####################################################################################

#		WEBSERVER

#####################################################################################
#####################################################################################

# Apache
dnf install -y httpd

# PHP
dnf install -y php php-mysql composer

sed -i 's|display_errors = Off|display_errors = On|g' /etc/php.ini

# Composer packages
composer global require "laravel/installer"
composer global require "phpunit/phpunit"

# MariaDB
dnf install -y mariadb-server mariadb
systemctl start mariadb

mysqladmin -u root password "root"
mysql -u root -p"root" -e "UPDATE mysql.user SET Password=PASSWORD('root') WHERE User='root'"
mysql -u root -p"root" -e "DELETE FROM mysql.user WHERE user='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1')"
mysql -u root -p"root" -e "DELETE FROM mysql.user WHERE User=''"
mysql -u root -p"root" -e "DELETE FROM mysql.db WHERE Db='test' OR Db='test\_%'"
mysql -u root -p"root" -e "FLUSH PRIVILEGES"

# PhpMyAdmin
dnf install -y phpmyadmin

#####################################################################################
#####################################################################################

#		SERVICES

#####################################################################################
#####################################################################################

# Enable services
systemctl enable httpd mariadb

# Add user to service groups
usermod -aG vboxusers $user_name
usermod -aG apache $user_name
usermod -aG audio $user_name
usermod -aG realtime $user_name

#####################################################################################
#####################################################################################

#		COPY FILES / SETTINGS

#####################################################################################
#####################################################################################

# Files
cp -r wallpapers/. /usr/share

# Settings
cp -r skel/. $home/.
cp -r skel/. /etc/skel/.

# Set right ownership
chown -R $user_name:$user_name $home

#####################################################################################
#####################################################################################

#		COPY BINARIES

#####################################################################################
#####################################################################################

# Markdown to PDF
cp scripts/md2pdf.sh /usr/bin/md2pdf
chmod +x /usr/bin/md2pdf

# Mail backup
cp scripts/mailbackup.sh /usr/bin/mailbackup
chmod +x /usr/bin/mailbackup

# Create vhost
cp scripts/createvhost.sh /usr/bin/createvhost
chmod +x /usr/bin/createvhost

#####################################################################################
#####################################################################################

#		FINISH

#####################################################################################
#####################################################################################

clear

echo 'Your computer is set up! The system will reboot within one minute...'

shutdown -r +1
