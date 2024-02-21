#!/usr/bin/env bash

# Inspired by: https://gist.github.com/Vincibean/baf1b76ca5147449a1a479b5fcc9a222#file-my-nixos-installation-md
# Install nixos-minimal-[VERSION].iso

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
mount /dev/disk/by-label/boot  /mnt/boot
swapon /dev/sda3
nixos-install


# Configuration
#nixos-generate-config --root /mnt
#TODO: use nix home-manager instead?
cd
git clone https://github.com/theshteves/dotfiles.git
cd dotfiles
make nixos


reboot
