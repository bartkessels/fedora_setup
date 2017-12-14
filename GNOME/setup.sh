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

mkdir $home/Downloads
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

# Enable copr repos
dnf copr -y enable bartkessels/apagenerator
dnf copr -y enable bartkessels/getit
dnf copr -y enable bartkessels/ghostwriter

# Add repo for vscode
rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo

# RPM fusion repos
rpm --quiet --query rpmfusion-free-release || dnf -y --nogpgcheck install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
rpm --quiet --query rpmfusion-nonfree-release || dnf -y --nogpgcheck install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Update
dnf update --refresh -y

#####################################################################################
#####################################################################################

#		SETTINGS

#####################################################################################
#####################################################################################

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
dnf install -y gnome-shell-extension-drive-menu gnome-shell-extension-alternate-tab gnome-shell-extension-launch-new-instance gnome-shell-extension-user-theme gnome-shell-extension-topicons-plus

# Utilities
dnf install -y whois pandoc pdfmod gnome-todo luckybackup ffmpeg getit apagenerator ghostwriter

# Nautilus extension
dnf install -y seahorse-nautilus gnome-terminal-nautilus

# LaTeX Editors / Packages
dnf install -y gummi latexila
dnf install -y texlive-scheme-full

# Audio Editors / Players
dnf install -y audacity ardour5
dnf install -y lollypop

# Image Editors
dnf install -y gimp gnome-photos

# Video Editors
dnf install -y blender pitivi

# Development Editors / Editor Plugins / Development Kits / Tools / Compilers / Libraries / Completion libraries / Package Tools / Docs / VSCode extensions
dnf install -y vim gnome-builder glade code @development-tools @gnome-software-development
dnf install -y vim-nerdtree
dnf install -y java-1.8.0-openjdk-devel automake cmake autoconf zlib-devel.i686 ncurses-devel.i686 ant gettext-devel autoconf-archive intltool itstool gtksourceview3-devel
dnf install -y python3-jedi clang clang-libs glide make
dnf install -y dia meld sqlitebrowser gitg
dnf install -y gcc
dnf install -y gtk+-devel gtk3-devel libsoup-devel zlib.i686 ncurses-libs.i686 bzip2-libs.i686 python3-devel gtksourceview3-devel @development-libs
dnf install -y fedora-packager fedora-review @rpm-development-tools meson ninja-build
dnf install -y gtk3-devel-docs

code --user-data-dir=$HOME/.vscode/extensions --install-extension eamodio.gitlens
code --user-data-dir=$HOME/.vscode/extensions --install-extension ms-python.python
code --user-data-dir=$HOME/.vscode/extensions --install-extension bibhasdn.django-html
code --user-data-dir=$HOME/.vscode/extensions --install-extension PKief.material-icon-theme

# Web
dnf install -y filezilla transmission youtube-dl offlineimap

# Office
dnf install -y aspell-nl libreoffice-langpack-nl gnome-calendar

# Containers
dnf install -y docker docker-compose

# Password Management
dnf install -y keepassxc

# Other
dnf install -y tuxguitar brasero

#####################################################################################
#####################################################################################

#		COMPILE SOFTWARE

#####################################################################################
#####################################################################################

# Arc flatabulous theme
cd $HOME
git clone https://github.com/andreisergiu98/arc-flatabulous-theme
cd arc-flatabulous-theme
./autogen.sh --prefix=/usr
make install
cd $HOME
rm -rf arc-flatabulous-theme

# Paper theme
cd $HOME
git clone https://github.com/snwh/paper-icon-theme
cd paper-icon-theme
./autogen.sh --prefix=/usr
make install
cd $HOME
rm -rf paper-icon-theme

#####################################################################################
#####################################################################################

#		SERVICES

#####################################################################################
#####################################################################################

# Enable services
systemctl enable httpd docker

# Add user to service groups
usermod -aG docker $user_name
usermod -aG apache $user_name
usermod -aG audio $user_name
usermod -aG realtime $user_name
usermod -aG mock $user_name

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

#####################################################################################
#####################################################################################

#		FINISH

#####################################################################################
#####################################################################################

clear

echo 'Your computer is set up! The system will reboot within one minute...'

shutdown -r +1
