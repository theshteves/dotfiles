{ config, lib, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "bruh";
  home.homeDirectory = "/home/bruh";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

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

    pkgs.bashInteractive
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
    ".bash_profile".source = lib.mkForce /home/bruh/dotfiles/.bash_profile;
    ".bashrc".source = lib.mkForce /home/bruh/dotfiles/.bashrc;
    ".vimrc".source = lib.mkForce /home/bruh/dotfiles/.vimrc;
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/bruh/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "vim";
    TERMINAL = "alacritty";
    NIX_SHELL_PRESERVE_PROMPT = 1; # https://unix.stackexchange.com/a/691405 + https://bleepcoder.com/alacritty/293206538/default-shell-on-macos-should-use-login
  };

  programs = {
    # Let Home Manager install and manage itself.
    home-manager.enable = true;
    
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
