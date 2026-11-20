{
    description = "No description lol.";

    inputs = {
        nixpkgs.url = "nixpkgs/nixos-26.05";
        nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
        import-tree.url = "github:vic/import-tree";
        flake-parts.url = "github:hercules-ci/flake-parts";
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
        inputs:
        inputs.flake-parts.lib.mkFlake { inherit inputs; } {
            systems = [ "x86_64-linux" ];
            imports = [
                inputs.home-manager.flakeModules.home-manager
                (inputs.import-tree ./modules)
            ];
        };
}
