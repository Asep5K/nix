{
    description = "No description lol.";

    inputs = {
        nixpkgs.url = "nixpkgs/nixos-unstable"; # url = "nixpkgs/nixos-26.05";
        home-manager = {
            # url = "github:nix-community/home-manager/release-26.05";
            url = "github:nix-community/home-manager";
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
            home-manager,
            nvf,
            ...
        }:
        {
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
                            sharedModules = [ nvf.homeModules.default ];
                            users.iuno = import ./home;
                        };
                    }
                ];
            };
        };
}
