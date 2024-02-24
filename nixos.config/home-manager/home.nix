{ config, lib, pkgs, ... }:
{
  home.username = "bruh";
  home.homeDirectory = "/home/bruh";
  home.stateVersion = "23.11"; # See release notes for breaking changes

  #TODO: delegate some NixOS configuration.nix to this flake
  home.packages = with pkgs; [
    bashInteractive
    #firefox
    #btop
    #parted
    #neofetch
    #duf
    #roboto-mono

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  home.file = {
    # Make '~/.screenrc' a symlink to the Nix store copy
    # ".screenrc".source = dotfiles/screenrc;

    #".bash_profile".source = ${dotfiles}/.bash_profile;
    ".bash_profile".source = lib.mkForce ../../.bash_profile;
    ".bashrc".source = lib.mkForce ../../.bashrc;
    ".vimrc".source = lib.mkForce  ../../.vimrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #  /etc/profiles/per-user/bruh/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "vim";
    TERMINAL = "alacritty";
    #NIX_SHELL_PRESERVE_PROMPT = 1; # https://unix.stackexchange.com/a/691405 + https://bleepcoder.com/alacritty/293206538/default-shell-on-macos-should-use-login
  };

  programs = {
    feh.enable = true;
    home-manager.enable = true; # let install & manage itself

    bash = {
      enable = true;
      #profileExtra = builtins.readFile ./bash_profile;
      #initExtra = builtins.readFile ./bashrc;
      #undistractMe (NixOS search programs.bash !!)
    };
    git = {
      enable = true;
      userName = "theshteves";
      userEmail = "stevenkneiser@gmail.com";
    };
  };
}
