{
  description = "Steven Kneiser's nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    dotfiles.url = "github:theshteves/dotfiles";
    # hardware.url = "github:nixos/nixos-hardware";
    # nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;
  in {
    # Standalone home-manager configuration entrypoint
    # Available through `home-manager switch --flake .#bruh@vbox`
    homeConfigurations = {
      "bruh" = home-manager.lib.homeManagerConfiguration {
      #"bruh@vbox" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;  # Home-manager requires 'pkgs' instance
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [./home-manager/home.nix];
      };
    };

    # NixOS configuration entrypoint
    # Available through `nixos-rebuild switch --flake .#vbox`
    #nixosConfigurations = {
    #  vbox = nixpkgs.lib.nixosSystem {
    #    specialArgs = {inherit inputs outputs;};
    #    # > Our main nixos configuration file <
    #    modules = [./nixos/configuration.nix];
    #  };
    #};
  };
}
