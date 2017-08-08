#!/bin/bash

# Folders
cp -r $HOME/Templates skel/.
cp -r $HOME/.config skel/.
cp -r $HOME/.config-files skel/.
cp -r $HOME/.dia skel/.
cp -r $HOME/.gimp* skel/.
cp -r $HOME/.gnome skel/.
cp -r $HOME/.libreoffice-templates skel/.
cp -r $HOME/.local skel/.
cp -r $HOME/.mozilla skel/.
cp -r $HOME/.tuxguitar* skel/.

# Files
cp -r $HOME/.bashrc skel/.
cp -r $HOME/.vimrc skel/.
cp -r $HOME/.zshrc skel/.

# Remove trashed files
rm -rf skel/.local/share/Trash/files/*
rm -rf skel/.local/share/Trash/info/*

# Remove GNOME keyring content
rm -rf skel/.local/share/keyrings/*

# Remove evolution data
rm -rf skel/.local/share/evolution
rm -rf skel/.config/evolution
