{ config, inputs, lib, pkgs, ... }:
let
  dotfilesRepo = "https://github.com/theshteves/dotfiles.git";
  dotfilesDir = "${config.home.homeDirectory}/dotfiles";
in {
  home = {
    username = "bruh";
    homeDirectory = "/home/bruh";

    packages = with pkgs; [
      git
      gnumake
      #steam
      btop
      neofetch
      # fortune cowsay lolcat
      # irssi
      # tmux
      # node
      # python
      # bash-git-prompt
      # docker/rancher firefox flux dropbox slack??
    ];

    # Use 'home.activation' to ensure the operation is performed
    #   when Home Manager is activated
    activation.cloneDotfiles = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      if [ ! -d ${dotfilesDir} ]; then
        echo "Cloning dotfiles from ${dotfilesRepo} to ${dotfilesDir}"
        git clone ${dotfilesRepo} ${dotfilesDir}
        pushd ${dotfilesDir}
        make
        popd
      else
        echo "Dotfiles directory already exists at ${dotfilesDir}"
      fi
    '';
  };

  programs = {
    home-manager.enable = true;
    git.enable = true;
  };

  imports = [
    # If you want to use home-manager modules from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModule

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
  ];

  nixpkgs = {
    overlays = [
      # If you want to use overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";
}
}
