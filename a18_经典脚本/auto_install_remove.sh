#!/bin/bash
# by author suliangliang on 2022-08-03
sudo apt-get remove thunderbird simple-scan simple-scan gnome-mahjongg aisleriot gnome-mines cheese transmission-common gnome-orca gnome-sudoku  totem rhythmbox onboard deja-dup libreoffice-common 
sudo add-apt-repository ppa:gnome-terminator
sudo apt-get install vim vpnc git axel openssh-server cmake qtcreator build-essential gdb axel lnav unrar net-tools terminator
sudo apt-get update && sudo apt-get upgrade
