#!/bin/bash

offlineimap

current_date=$(date +"%Y-%m-%d")
tar -cf $HOME/Backups/Mail/$current_date.tar.gz $HOME/Backups/Mail/bk-mail/*

rm -r $HOME/Backups/Mail/bk-mail

