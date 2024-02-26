{ config, inputs, lib, pkgs, ... }:
{
  imports = [
    # If you want to use modules from other flakes (such as nixos-hardware):
    # inputs.hardware.nixosModules.common-cpu-amd
    # inputs.hardware.nixosModules.common-ssd

    # You can also split up your configuration and import pieces of it here:
    # ./users.nix

    ./hardware-configuration.nix
  ];

  hardware.opengl.enable = true;

  boot.loader = {
    systemd-boot = {
      enable = true;
    };
    efi = {
      canTouchEfiVariables = true;
    };
  };

  time.timeZone = "US/Eastern";
  i18n.defaultLocale = "en_US.UTF-8";

  networking.hostName = "vbox";
  networking.networkmanager.enable = true;
  networking.firewall.enable = false;
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  services = {
    xserver = {
      enable = true;
      #autorun = false;
      xkb.layout = "us";
      virtualScreen = {
        x = 1920;
        y = 1080;
      };
      videoDrivers = lib.mkOverride 10 [ "vmware" ];
      #xkb.options = "eurosign:e,caps:escape";
      displayManager = {
        autoLogin = {
          enable = true;
          user = "bruh";
        };
        #sddm.enable = true;
        defaultSession = "none+i3"; # xfce+i3 is best of both worlds
        lightdm = {
          enable = true;
          #greeter.enable = true;
          background = lib.mkForce "/home/bruh/dotfiles/nixos.config/home-manager/wallpaper-nixos-1920x1080.jpg"; #"#222222";
        };
        #sessionCommands = ''
        #  ${pkgs.xorg.xrdb}/bin/xrdb -merge ~/.Xdefaults
        #'';
      };
      windowManager = { #TODO: try hyprland + catppuccin someday
        i3 = {
          enable = true;
          extraPackages = with pkgs; [
            dmenu
            i3status
            i3lock
            i3blocks
          ];
        };
        #bspwm = {
        #  enable = true;
        #};
      };
      desktopManager = {
        #xfce.enable = true;
        #xterm.enable = true;
        #plasma5.enable = true;
      };
      libinput.enable = true; # enable touchpad support
    };
    #printing.enable = true;
    picom = {
      enable = true;
      shadow = true;
      inactiveOpacity = 0.6;
      activeOpacity = 0.92;
      menuOpacity = 0.84;
      fadeDelta = 4;
      fade = true;
    };
  };
  # services.printing.enable = true;
  services.openssh = {
    enable = true;
    settings = {
      # Forbid root login through SSH.
      PermitRootLogin = "no";
      PasswordAuthentication = true;  #TODO: disable
    };
  };

  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  nix.settings = {
    experimental-features = "nix-command flakes";
    auto-optimise-store = true;
    allowed-users = [ "bruh" ];
  };

  nixpkgs = {
    #overlays = [];
    config = {
      allowUnfree = true;
    };
  };

  # This will add each flake input as a registry
  # To make nix3 commands consistent with your flake
  #nix.registry = (lib.mapAttrs (_: flake: {inherit flake;})) ((lib.filterAttrs (_: lib.isType "flake")) inputs);

  # This will additionally add your inputs to the system's legacy channels
  # Making legacy nix commands consistent as well, awesome!
  #nix.nixPath = ["/etc/nix/path"];
  #environment.etc =
  #  lib.mapAttrs'
  #  (name: value: {
  #    name = "nix/path/${name}";
  #    value.source = value.flake;
  #  })
  #  config.nix.registry;

  environment.systemPackages = with pkgs; [
    bashInteractive
    vim
    git
    #mumble
    #bspwm
    #sxhkd
    xterm
    xorg.xrdb
    feh
    xclip
    #roboto-mono
    #kitty
    #keepassxc
    alacritty
    polybar
    picom
    home-manager
  ];

  environment.sessionVariables = {
    EDITOR = "vim";
    TERMINAL = "alacritty";
  };

  environment.pathsToLink = [ "/libexec" ]; # Links /libexec from derivations to /run/current-system/sw

  users = {
    defaultUserShell = pkgs.bashInteractive; #TODO: remove redundancy
    users = {
      bruh = {
        isNormalUser = true;
        password = "bruh";  #TODO: Reset w/ 'passwd'
        extraGroups = [ "wheel" "networkmanager" ]; # "wheel" enables 'sudo' # audio, docker, etc
        packages = with pkgs; [
          firefox  #TODO: uBlock origin
          btop
          parted
          neofetch
          duf
          #roboto-mono
        ];
      };
    };
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
  #programs.hyprland.enable = true;

  # Backup config file: /run/current-system/configuration.nix
  system.copySystemConfiguration = true;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.11";
}
