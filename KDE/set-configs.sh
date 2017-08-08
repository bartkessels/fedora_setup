#!/bin/bash

# Folders
cp -r $HOME/Templates skel/.
cp -r $HOME/.config skel/.
cp -r $HOME/.config-files skel/.
cp -r $HOME/.local skel/.
cp -r $HOME/.tuxguitar* skel/.

# Files
cp -r $HOME/.bashrc skel/.
cp -r $HOME/.vimrc skel/.
cp -r $HOME/.zshrc skel/.

# Remove trashed files
rm -rf skel/.local/share/Trash/files/*
rm -rf skel/.local/share/Trash/info/*

# Remove keyring content
rm -rf skel/.local/share/kwalletd
rm -rf skel/.kde/share/apps/kwallet

