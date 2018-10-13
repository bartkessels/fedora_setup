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

# Ask for user input
echo 'What is your GIT e-mail address?'
read git_mail

echo "What is the computer name? [BKlaptop/BKcomputer]"
read computer_name

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

mkdir -p $home/Downloads
mkdir -p $home/Git-projects/Go
mkdir -p $home/Public
mkdir -p $home/Webserver

ln -sf $sync_folder/Documenten $home/Documents
ln -sf $sync_folder/Muziek $home/Music
ln -sf $sync_folder/Afbeeldingen $home/Pictures
ln -sf $sync_folder/Videos $home/Videos
ln -sf $sync_folder/Backups $home/Backups
ln -sf $sync_folder/Boeken $home/Books
ln -sf $sync_folder/e-books $home/E-Books
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

# Enable copr repos
dnf copr -y enable bartkessels/apagenerator
dnf copr -y enable bartkessels/getit
dnf copr -y enable bartkessels/simpleconvert
dnf install -y fedora-workstation-repositories

# RPM fusion repos
rpm --quiet --query rpmfusion-free-release || dnf -y --nogpgcheck install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
rpm --quiet --query rpmfusion-nonfree-release || dnf -y --nogpgcheck install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Update
dnf update --refresh -y

# Add flatpack repo's
flatpak remote-add flathub https://flathub.org/repo/flathub.flatpakrepo

#####################################################################################
#####################################################################################

#		SETTINGS

#####################################################################################
#####################################################################################

# Themes
dnf install -y arc-theme paper-icon-theme
flatpak install flathub org.gtk.Gtk3theme.Arc

# Settings GUI tools
dnf install -y dconf-editor gnome-tweak-tool firewall-config

# Fonts
dnf install -y bitstream-vera-fonts-common linux-libertine-fonts-common google-noto-fonts-common google-noto-emoji-fonts google-android-emoji-fonts open-sans-fonts
ln -s /etc/fonts/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d

# Codecs
dnf install -y gstreamer1-libav gstreamer1-plugins-bad-free gstreamer1-plugins-bad-freeworld gstreamer1-plugins-base gstreamer1-plugins-good gstreamer1-plugins-ugly gstreamer-ffmpeg gstreamer-plugins-bad gstreamer-plugins-bad-free gstreamer-plugins-bad-nonfree gstreamer-plugins-base gstreamer-plugins-espeak gstreamer-plugins-fc gstreamer-plugins-good gstreamer-plugins-ugly gstreamer-rtsp amrnb amrwb faac faad2 flac lame libdca libmad libmatroska x264 x265 xvidcore

# Archive formats
dnf install -y cabextract lzip p7zip p7zip-plugins unrar

# Git
printf "[user]\nemail=$git_mail\nname=$full_name\n[diff]\ntool=meld\n[push]\ndefault=simple" > $home/.gitconfig

# Shell / Plugins
dnf install -y zsh
usermod -s /bin/zsh $user_name

git clone https://github.com/robbyrussell/oh-my-zsh.git $home/.oh-my-zsh

# Inotify
printf '# Increase inofity watch limit\nfs.inotify.max_user_watches = 100000000' > /etc/sysctl.d/90-inotify.conf
printf '\n\n# Increase inofity watch limit\nfs.inotify.max_user_watches = 100000000' >> /usr/lib/sysctl.d/50-default.conf

# Audio
printf '* hard rtprio 0\n* soft rtprio 0\n@realtime hard rtprio 20\n@realtime soft rtprio 10\n@audio - rtprio 95\n@audio - memlock unlimited' >> /etc/security/limits.conf

# Create groups
groupadd realtime
groupadd docker

# Hostname
hostnamectl set-hostname --static $computer_name

# Update dnf conf
sed -i 's|clean_requirements_on_remove=True|clean_requirements_on_remove=False|g' /etc/dnf/dnf.conf

#####################################################################################
#####################################################################################

#		SOFTWARE

#####################################################################################
#####################################################################################

# GNOME extensions
dnf install -y gnome-shell-extension-drive-menu gnome-shell-extension-alternate-tab gnome-shell-extension-launch-new-instance gnome-shell-extension-topicons-plus

# Utilities
dnf install -y whois pandoc pdfmod ffmpeg getit apagenerator

# Toolkits
dnf install -y qt5

# Nautilus extension
dnf install -y seahorse-nautilus gnome-terminal-nautilus

# Audio Editors
dnf install -y ardour5

# Video Editors / players
dnf install -y simpleconvert
pip3 install gnomecast

# Backup
dnf install -y deja-dup deja-dup-nautilus

# Web
dnf install -y youtube-dl offlineimap

# Containers
dnf install -y docker docker-compose

# Other
dnf install -y tuxguitar brasero

#####################################################################################
#####################################################################################

#		Development

#####################################################################################
#####################################################################################

# Qt
dnf install -y qt-creator
dnf install -y qt5-devel

# Java
dnf install -y java-1.8.0-openjdk-devel

# Go
dnf install -y golang

# PHP
dnf install -y php
dnf install -y composer

# Tools
dnf install -y dia umbrello sqlitebrowser autoconf-archive

# Build systems
dnf install -y cmake make ant maven glide meson ninja-build

# Packaging
dnf install -y flatpak-builder fedora-packager fedora-review

# Compilers
dnf install -y gcc

# Libraries
dnf install -y @development-libs

#####################################################################################
#####################################################################################

#		FLATPAK PACKAGES

#####################################################################################
#####################################################################################

# Office
flatpak install -y flathub org.libreoffice.LibreOffice
flatpak install -y flathub org.gnome.Calendar
flatpak install -y flathub org.gnome.Contacts
flatpak install -y flathub org.gnome.Geary

# Video editors
flatpak install -y flathub org.blender.Blender
flatpak install -y flathub org.pitivi.Pitivi

# Video recorders
flatpak install -y flathub com.uploadedlobster.peek

# Audio editors
flatpak install -y flathub org.musicbrainz.Picard

# Audio players
flatpak install -y flathub org.gnome.Lollypop

# Image editors
flatpak install -y flathub org.gimp.GIMP
flatpak install -y flathub org.kde.krita

# Vector editors
flatpak install -y flathub org.inkscape.Inkscape

# Development editors
flatpak install -y flathub org.gnome.Builder
flatpak install -y flathub com.google.AndroidStudio
flatpak install -y flathub com.visualstudio.code

# Development tools
flatpak install -y flathub org.gnome.gitg
flatpak install -y flathub org.gnome.meld

# Web
flatpak install -y flathub com.transmissionbt.Transmission
flatpak install -y flathub com.skype.Client

# Password management
flatpak install -y flathub org.keepassxc.KeePassXC

#####################################################################################
#####################################################################################

#		COMPILE SOFTWARE

#####################################################################################
#####################################################################################

# Inqlude
git clone git://anongit.kde.org/inqlude-client
cd inqlude-client
cmake -G ninja
ninja install
cd ../
rm -rf inqlude-client

# Golang buffalo
mkdir buffalo
cd buffalo
wget  https://github.com/gobuffalo/buffalo/releases/download/v0.12.6/buffalo_0.12.6_linux_amd64.tar.gz
tar -xvzf buffalo_0.12.6_linux_amd64.tar.gz
mv buffalo-no-sqlite /usr/local/bin/buffalo
cd ../
rm -rf buffalo

#####################################################################################
#####################################################################################

#		SERVICES

#####################################################################################
#####################################################################################

# Add user to service groups
usermod -aG docker $user_name
usermod -aG audio $user_name
usermod -aG realtime $user_name
usermod -aG mock $user_name

# Start services on boot
sytemctl enable docker

#####################################################################################
#####################################################################################

#		COPY FILES / SETTINGS

#####################################################################################
#####################################################################################

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

#####################################################################################
#####################################################################################

#		FINISH

#####################################################################################
#####################################################################################

clear

echo 'Your computer is set up! The system will reboot within one minute...'

shutdown -r +1
