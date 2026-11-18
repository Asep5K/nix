{
    description = "No description lol.";

    inputs = {
        nixpkgs.url = "nixpkgs/nixos-26.05";
        nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
        home-manager = {
            url = "github:nix-community/home-manager/release-26.05";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        nvf = {
            url = "github:NotAShelf/nvf";
            inputs.nixpkgs.follows = "nixpkgs";
        };

    };

    outputs =
        {
            nixpkgs,
            nixpkgs-unstable,
            home-manager,
            nvf,
            ...
        }:
        let
            system = "x86_64-linux";
            pkgs-unstable = import nixpkgs-unstable {
                inherit system;
            };
        in
        {
            nixosConfigurations.nixosbtw = nixpkgs.lib.nixosSystem {
                inherit system;
                specialArgs = { inherit pkgs-unstable; };
                modules = [
                    ./configuration.nix
                    home-manager.nixosModules.home-manager
                    {
                        home-manager = {
                            useGlobalPkgs = true;
                            useUserPackages = true;
                            backupFileExtension = "backup";
                            extraSpecialArgs = { inherit pkgs-unstable; };
                            sharedModules = [ nvf.homeModules.default ];
                            users.iuno = import ./home;
                        };
                    }
                ];
            };
        };
}
