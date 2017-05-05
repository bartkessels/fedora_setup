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
dnf install -y paper-gtk-theme arc-theme
dnf install -y paper-icon-theme

dnf install -y breeze-cursor-theme

# Git
printf "[user]\nemail='$git_mail'\nname='$full_name'\n[diff]\ntool=meld\n[push]\ndefault=simple" > $home/.gitconfig

# Shell / Plugins
dnf install -y zsh
usermod -s /bin/zsh $user_name

git clone https://github.com/robbyrussell/oh-my-zsh.git $home/.oh-my-zsh

# Inotify
printf '# Increase inofity watch limit\nfs.inotify.max_user_watches = 100000000' > /etc/sysctl.d/90-inotify.conf
printf '\n\n# Increase inofity watch limit\nfs.inotify.max_user_watches = 100000000' >> /usr/lib/sysctl.d/50-default.conf

# Sudoers file
printf '\nDefaults env_reset,insults\n' >> /etc/sudoers

# Audio
printf '* hard rtprio 0\n* soft rtprio 0\n@realtime hard rtprio 20\n@realtime soft rtprio 10\n@audio - rtprio 95\n@audio - memlock unlimited' >> /etc/security/limits.conf

# Create groups
groupadd realtime

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
dnf install -y gnome-shell-extension-pomodoro gnome-shell-extension-drive-menu gnome-shell-extension-alternate-tab gnome-shell-extension-launch-new-instance gnome-shell-extension-topicons-plus

# Utilities
dnf install -y whois pandoc deja-dup grsync gpick pdfmod gnome-todo luckybackup ghostwriter ffmpeg

# Nautilus extension
dnf install -y seahorse-nautilus gnome-terminal-nautilus

# LaTeX Editors / Packages
dnf install -y gummi latexila
dnf install -y texlive-crossreference texlive-upquote texlive

# Audio Editors / Players
dnf install -y audacity ardour5
dnf install -y lollypop

# Image Editors
dnf install -y gimp

# Video Editors / Recorders / Libs
dnf install -y blender pitivi
dnf install -y simplescreenrecorder
dnf install -y libdvdcss

# Development Editors / Editor Plugins / Development Kits / Tools / Compilers / Libraries / Completion libraries / Package Tools / Docs / Atom / Atom Packages
dnf install -y vim gnome-builder glade
dnf install -y vim-nerdtree
dnf install -y java-1.8.0-openjdk-devel automake autoconf zlib-devel.i686 ncurses-devel.i686 ant gettext-devel autoconf-archive intltool itstool
dnf install -y python3-jedi clang clang-libs gnome-code-assistance
dnf install -y dia meld sqlitebrowser pencil planner gitg
dnf install -y gcc-c++
dnf install -y gtk+-devel gtk3-devel libsoup-devel zlib.i686 ncurses-libs.i686 bzip2-libs.i686 gtkmm30 gtkmm30-devel python-devel python3-devel rust rust-gdb gtksourceview3-devel
dnf install -y fedora-packager fedora-review
dnf install -y rust-doc

wget -O atom.rpm https://atom.io/download/rpm
dnf install -y atom.rpm
rm atom.rpm

apm install atom-material-ui atom-material-syntax file-icons language-blade blade-snippets minimap docblockr

# Browsers / Web / Other
dnf install -y epiphany
dnf install -y filezilla transmission youtube-dl offlineimap

# Office
dnf install -y aspell-nl libreoffice-langpack-nl gnome-calendar

# Virtualization
dnf install -y VirtualBox

# Password Management
dnf install -y keepassx

# Other
dnf install -y tuxguitar brasero kde-connect

#####################################################################################
#####################################################################################

#		VIM

#####################################################################################
#####################################################################################

# Create required directories
mkdir -p $home/.vim/autoload
mkdir -p $home/.vim/bundle
mkdir -p $home/.vim/colors
mkdir -p $home/.vim/ftplugin

# Download .vim files
wget https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim -O $home/.vim/autoload/pathogen.vim
wget https://raw.githubusercontent.com/thesheff17/youtube/master/vim/wombat256mod.vim -O $home/.vim/colors/wombat256.vim
wget https://raw.githubusercontent.com/thesheff17/youtube/master/vim/python_editing.vim -O $home/.vim/ftplugin/python_editing.vim

# Clone plugins
git clone https://github.com/tpope/vim-sensible.git $home/.vim/bundle/vim-sensible
git clone https://github.com/kien/ctrlp.vim.git $home/.vim/bundle/ctrlp.vim
git clone https://github.com/scrooloose/nerdtree $home/.vim/bundle/nerdtree
git clone https://github.com/jistr/vim-nerdtree-tabs.git $home/.vim/bundle/vim-nerdtree-tabs
git clone https://github.com/klen/python-mode.git $home/.vim/bundle/python-mode
git clone https://github.com/Lokaltog/vim-powerline.git $home/.vim/bundle/vim-powerline
git clone https://github.com/valloric/youcompleteme $home/.vim/bundle/youcompleteme
git clone https://github.com/shougo/vimproc.vim $home/.vim/bundle/vimproc.vim
git clone https://github.com/shougo/unite.vim $home/.vim/bundle/unite.vim
git clone https://github.com/m2mdas/phpcomplete-extended $home/.vim/bundle/phpcomplete-extended
git clone https://github.com/jwalton512/vim-blade $home/.vim/bundle/vim-blade
git clone https://github.com/rip-rip/clang_complete $home/.vim/bundle/clang_complete
git clone https://github.com/jiangmiao/auto-pairs $home/.vim/bundle/auto-pairs

# Setup youcompleteme
cd $home/.vim/bundle/youcompleteme
git submodule update --init --recursive
./install.py --all
cd -

# Setup vimproc.vim
cd $home/.vim/bundle/vimproc.vim
make
cd -

# Setup clang_complete
cd $home/.vim/bundle/clang_complete
make install
cd -

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
