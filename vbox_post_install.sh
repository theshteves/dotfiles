#    OK to auto-generated i3 config
# git clone https://github.com/theshteves/dotfiles
# chmod +x ~/dotfiles/vbox_post_install.sh
# source !$

rm -rf ~/.config/*
ln -sfn ~/dotfiles/nixos.config/* ~/.config  #TODO: careful of pre-existing config
home-manager switch --flake ~/dotfiles/nixos.config#vbox
systemctl --user restart picom.service
# <Mod+Shift+R> to restart i3
