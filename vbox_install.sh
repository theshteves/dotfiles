#!/usr/bin/env bash

# Inspired by: https://gist.github.com/Vincibean/baf1b76ca5147449a1a479b5fcc9a222#file-my-nixos-installation-md

# Pre-installation
#TODO: what if no internet on new machine?
#TODO: Install nixos-minimal-[VERSION].iso

# nix-shell -p git parted home-manager # gnumake vim
#TODO: pre-install via home-manager?? instead of vbox_install.sh?
# git clone https://github.com/theshteves/dotfiles.git
# cd dotfiles
# chmod +x vbox_install.sh
# sudo ./vbox_install.sh

# Partitioning (UEFI)
DRIVE="/dev/sda"
parted $DRIVE -- mklabel gpt

parted $DRIVE -- mkpart ESP fat32 1MiB 512MiB
parted $DRIVE -- set 1 esp on
parted $DRIVE -- mkpart primary 512MiB -8GiB
parted $DRIVE -- mkpart primary linux-swap -8GiB 100%


# Formatting
mkfs.fat -F 32 -n boot /dev/sda1
mkfs.ext4 -L nixos /dev/sda2
mkswap -L swap /dev/sda3


# Installation
mount /dev/disk/by-label/nixos /mnt
mkdir -p /mnt/boot
mount /dev/disk/by-label/boot  /mnt/boot
swapon /dev/sda3


## Configuration
##nixos-generate-config --root /mnt
#cd
#git clone https://github.com/theshteves/dotfiles.git
#cd dotfiles
mkdir -p /mnt/etc/nixos
cp ./nixos.config/nixos/* /mnt/etc/nixos
nixos-install


#reboot
