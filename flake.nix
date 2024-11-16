{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    #agenix.url = "github:ryantm/agenix";

    kmonad = {
      url = "git+https://github.com/kmonad/kmonad?submodules=1&dir=nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Uncomment if you plan to use disko for disk management
    # disko.url = "github:nix-community/disko";
    # disko.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs @ {
    nixpkgs,
    home-manager,
    kmonad,
    ...
  }: {
    nixosConfigurations.mysystem = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      modules = [
        ./nixos/configuration.nix
        # disko.nixosModules.disko
        #agenix.nixosModules.age
        #kmonad.nixosModules.default
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.titanknis = import ./home-manager/home.nix;

          # Optionally pass arguments to home.nix
          # home-manager.extraSpecialArgs = {
          #   # Add your special arguments here
          # };

          # Maintain compatibility with the original NixOS version
          system.stateVersion = "24.05"; # Keep original NixOS state version
        }
      ];
    };
  };
}
