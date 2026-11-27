{
  description = "No description lol.";

  inputs = {
    nixpkgs.url = "github:NixOs/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:NixOs/nixpkgs/nixos-unstable";
    import-tree.url = "github:vic/import-tree";
    flake-parts.url = "github:hercules-ci/flake-parts";
    doasedit.url = "git+https://codeberg.org/Asep5K/doasedit";
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
