{
  description = "System configuration";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manger = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;
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
        specialArgs = {inherit inputs outputs;};

        modules = [
          ./system/configuration.nix
        ];
      };
    };
    homeConfigurations = {
      "ed@laptop" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {inherit inputs outputs;};

        modules = [
          ./users/ed/home.nix
        ];
      };
    };
  };
}
