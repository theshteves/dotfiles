# configuration.nix(5) man page
# https://search.nixos.org/options
# in the NixOS manual (`nixos-help`)
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

  boot.loader = {
    systemd-boot = {
      enable = true;
    };
    efi = {
      canTouchEfiVariables = true;
      #efiSysMountPoint = "/boot/efi";
    };
    grub = {
      #enable = true;
      useOSProber = true;
      #efiSupport = true;
      #efiInstallAsRemovable = true;
      #device = "/dev/sda"; # or "nodev" for efi only
    };
  };

  time.timeZone = "US/Eastern";
  i18n.defaultLocale = "en_US.UTF-8";

  networking.hostName = "hostbruh";
  networking.networkmanager.enable = true;
  # networking.firewall.enable = false;
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  #services.xserver.enable = true;
  #services.xserver.xkb.layout = "us";
  #services.xserver.xkb.options = "eurosign:e,caps:escape";
  #services.xserver.libinput.enable = true; # enable touchpad support
  # services.printing.enable = true;
  # services.openssh = {
  #   enable = true;
  #   settings = {
  #     # Forbid root login through SSH.
  #     PermitRootLogin = "no";
  #     PasswordAuthentication = false;
  #   };
  # };

  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

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

  nix.settings = {
    experimental-features = "nix-command flakes";
    auto-optimise-store = true;
  };

  nixpkgs = {
    #overlays = [];
    config = {
      allowUnfree = true;
    };
  };

  environment.systemPackages = with pkgs; [
    vim
    git
  ];

  users.users = {
    bruh = {
      isNormalUser = true;
      password = "bruh";  #TODO: Reset w/ `passwd`
      extraGroups = [ "wheel" "networkmanager" ]; # "wheel" enables `sudo` # audio, docker, etc
      packages = with pkgs; [
        vim
        git
      ];
    };
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # Backup config file: /run/current-system/configuration.nix
  system.copySystemConfiguration = true;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.11";
}
