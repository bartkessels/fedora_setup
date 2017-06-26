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

# Install fedy for repos
wget -O fedy-installer http://folkswithhats.org/installer
chmod +x fedy-installer
./fedy-installer
rm fedy-installer

# Enable copr repos
dnf copr -y enable bartkessels/getit
dnf copr -y enable bartkessels/apagenerator

# Add repo for vscode
rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo

# Add repo for paper icon/gtk theme
dnf config-manager --add-repo http://download.opensuse.org/repositories/home:snwh:paper/Fedora_25/home:snwh:paper.repo

# Update
dnf update --refresh -y

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

# Themes / Icons / Arc-flatabulous / Cursors
dnf install -y paper-gtk-theme arc-theme
dnf install -y paper-icon-theme

git clone https://github.com/andreisergiu98/arc-flatabulous-theme
cd arc-flatabulous-theme
./autogen.sh --prefix=/usr
make install
cd -
rm -rf arc-flatabulous-theme

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
groupadd docker

# Hostname
hostnamectl set-hostname --static $computer_name

# Update dnf conf
sed -i 's|clean_requirements_on_remove=True|clean_requirements_on_remove=False|g' /etc/dnf/dnf.conf

# Grub timeout
sed -i 's/GRUB_TIMEOUT=5/GRUB_TIMEOUT=0/g' /etc/default/grub
grub2-mkconfig -o /boot/grub2/grub.cfg

#####################################################################################
#####################################################################################

#		SOFTWARE

#####################################################################################
#####################################################################################

# GNOME extensions
dnf install -y gnome-shell-extension-drive-menu gnome-shell-extension-alternate-tab gnome-shell-extension-launch-new-instance gnome-shell-extension-topicons-plus

# Utilities
dnf install -y whois pandoc gpick pdfmod gnome-todo luckybackup ffmpeg ctags getit apagenerator remmina

# Nautilus extension
dnf install -y seahorse-nautilus gnome-terminal-nautilus

# LaTeX Editors / Packages
dnf install -y gummi latexila
dnf install -y texlive-scheme-full

# Audio Editors / Players
dnf install -y audacity ardour5
dnf install -y lollypop

# Image Editors
dnf install -y gimp

# Video Editors
dnf install -y blender pitivi

# Development Editors / Editor Plugins / Development Kits / Tools / Compilers / Libraries / Completion libraries / Package Tools / Docs / VSCode extensions
dnf install -y vim gnome-builder glade code @development-tools @gnome-software-development
dnf install -y vim-nerdtree
dnf install -y java-1.8.0-openjdk-devel automake cmake autoconf zlib-devel.i686 ncurses-devel.i686 ant gettext-devel autoconf-archive intltool itstool
dnf install -y python3-jedi clang clang-libs nuget
dnf install -y dia meld sqlitebrowser pencil planner gitg
dnf install -y gcc-c++
dnf install -y gtk+-devel gtk3-devel libsoup-devel zlib.i686 ncurses-libs.i686 bzip2-libs.i686 gtkmm30 gtkmm30-devel python-devel python3-devel rust rust-gdb gtksourceview3-devel @development-libs
dnf install -y fedora-packager fedora-review @rpm-development-tools
dnf install -y rust-doc gtk3-devel-docs

code --user-data-dir=$home/.vscode/extensions --install-extension eamodio.gitlens
code --user-data-dir=$home/.vscode/extensions --install-extension felixfbecker.php-debug
code --user-data-dir=$home/.vscode/extensions --install-extension felixfbecker.php-intellisense
code --user-data-dir=$home/.vscode/extensions --install-extension ms-vscode.csharp
code --user-data-dir=$home/.vscode/extensions --install-extension ms-vscode.cpptools
code --user-data-dir=$home/.vscode/extensions --install-extension ms-vscode.mono-debug
code --user-data-dir=$home/.vscode/extensions --install-extension neilbrayfield.php-docblocker
code --user-data-dir=$home/.vscode/extensions --install-extension PKief.material-icon-theme

# Browsers / Web / Other
dnf install -y epiphany
dnf install -y filezilla transmission youtube-dl offlineimap

# Office
dnf install -y aspell-nl libreoffice-langpack-nl gnome-calendar

# Containers
dnf install -y docker docker-compose

# Password Management
dnf install -y keepassx

# Other
dnf install -y tuxguitar brasero

#####################################################################################
#####################################################################################

#		VIM

#####################################################################################
#####################################################################################

# Create required directories
mkdir -p $home/.vim/autoload
mkdir -p $home/.vim/bundle
mkdir -p $home/.vim/colors
mkdir -p $home/.vim/after

# Copy .vim files
cp vim/pathogen.vim $home/.vim/autoload/pathogen.vim
cp vim/wombat256mod.vim $home/.vim/colors/wombat256mod.vim

# Clone plugins
git clone https://github.com/jiangmiao/auto-pairs $home/.vim/bundle/auto-pairs
git clone https://github.com/valloric/youcompleteme $home/.vim/bundle/youcompleteme
git clone https://github.com/scrooloose/nerdtree $home/.vim/bundle/nerdtree
git clone https://github.com/jistr/vim-nerdtree-tabs.git $home/.vim/bundle/vim-nerdtree-tabs
git clone https://github.com/vim-scripts/gtk-vim-syntax.git $home/.vim/bundle/gtk-vim-syntax

# Setup youcompleteme
cd $home/.vim/bundle/youcompleteme
git submodule update --init --recursive
./install.py --clang-completer
cd -

# Setup GTK syntax highlighting
cp -r $home/.vim/bundle/gtk-vim-syntax/syntax $home/.vim/after/syntax
cp vim/c.vim $home/.vim/after/syntax/c.vim

# Generate ctags files
mkdir -p $home/.ctags
ctags -R --sort=1 --fields=+l --c++-kinds=+p -f $home/.ctags/gtkmm /usr/include/gtkmm-3.0
ctags -R --sort=1 --fields=+l --c++-kinds=+p --language-force=C -f $home/.ctags/gtk_c /usr/include/gtk-3.0/

#####################################################################################
#####################################################################################

#		WEBSERVER

#####################################################################################
#####################################################################################

# Apache
dnf install -y httpd

# PHP
dnf install -y php composer

sed -i 's|display_errors = Off|display_errors = On|g' /etc/php.ini

# Composer packages
composer global require "laravel/installer"
composer global require "phpunit/phpunit"

# Node
dnf install -y nodejs npm

# NPM packages
npm install -g yo bower grunt-cli gulp generator-aspnet

#####################################################################################
#####################################################################################

#		DOCKER

#####################################################################################
#####################################################################################

# Pull containers
docker pull microsoft/dotnet
docker pull eboraas/laravel

#####################################################################################
#####################################################################################

#		SERVICES

#####################################################################################
#####################################################################################

# Enable services
systemctl enable httpd docker

# Add user to service groups
usermod -aG docker $user_name
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

#####################################################################################
#####################################################################################

#		FINISH

#####################################################################################
#####################################################################################

clear

echo 'Your computer is set up! The system will reboot within one minute...'

shutdown -r +1
