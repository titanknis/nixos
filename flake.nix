{
  description = "NixOS configuration";

  inputs = {
    # Add the stable channel
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    kmonad = {
      url = "github:kmonad/kmonad?dir=nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      kmonad,
      disko,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      # This helper function takes all the inputs we need for a host
      mkHost =
        { hostname, username }:
        nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit
              inputs
              system
              username
              hostname
              ;
          };
          modules = [
            # Your machine's configuration.nix
            ./hosts/${hostname}/default.nix

            # Other modules
            disko.nixosModules.disko
            kmonad.nixosModules.default

            # Home-manager configuration
            home-manager.nixosModules.home-manager
            {
              home-manager.extraSpecialArgs = {
                inherit username inputs hostname;
              };
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.${username} = import ./hosts/${hostname}/home.nix;

              # nixpkgs.config.allowUnfree = true;
              system.stateVersion = "25.05"; # Did you read the comment?
            }
          ];
        };
    in
    {
      nixosConfigurations = {
        default = mkHost {
          hostname = "default";
          username = "titanknis";
        };

        vm = mkHost {
          hostname = "vm";
          username = "titanknis";
        };

        # Add more hosts as needed
        # hostname = mkHost {
        #   hostname = "hostname";
        #   username = "username";
        # };
      };
    };
}
