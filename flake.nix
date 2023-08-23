{
  description = "System configuration";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manger.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, home-manager, ... }:
  let
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
      };
    };

    lib = nixpkgs.lib;
  in {
    formatter.${system} = pkgs.nixpkgs-fmt;

    nixosConfigurations = {
      laptop = lib.nixosSystem {
        inherit system;
        
        modules = [
          ./system/configuration.nix
        ];
      };
    };
    homeManagerConfigurations = {
      ed = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        
        modules = [
          ./users/ed/home.nix
        ];
      };
    };
  };
}
