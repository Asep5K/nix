{
  description = "No description lol.";

  inputs = {
    nixpkgs = {
      # url = "nixpkgs/nixos-26.05";
      url = "nixpkgs/nixos-unstable";
    };
    home-manager = {
      # url = "github:nix-community/home-manager/release-26.05";
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }: {
    nixosConfigurations.nixosbtw = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            backupFileExtension = "backup";
            users.iuno = import ./home;
          };
        }
      ];
    };
  };
}
