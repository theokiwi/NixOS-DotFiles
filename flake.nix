{
description = "Main Flake";
inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
};
outputs = {self, nixpkgs, home-manager, ...}:
 let
        lib = nixpkgs.lib;
        system = "x86_64-linux";
          pkgs = import nixpkgs {
        	system = "x86_64-linux";
        	config.allowUnfree = true; 
      	};
        in {
    nixosConfigurations = {
        theokiwi = lib.nixosSystem{
            inherit system;
            modules = [ ./configuration.nix];
            };
        };
    homeConfigurations = {
        theokiwi = home-manager.lib.homeManagerConfiguration{
            inherit pkgs;
            modules = [ ./home.nix];
            };
        };
    };
}
