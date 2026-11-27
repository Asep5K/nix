{
  self,
  inputs,
  ...
}:
let
  system = "x86_64-linux";
  pkgs-unstable = import inputs.nixpkgs-unstable {
    inherit system;
  };
in
{
  flake.nixosConfigurations.nixosbtw = inputs.nixpkgs.lib.nixosSystem {
    inherit system;
    specialArgs = { inherit pkgs-unstable; };
    modules = (builtins.attrValues self.nixosModules) ++ [
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          backupFileExtension = "backup";
          extraSpecialArgs = {
            inherit pkgs-unstable;
          };
          users.iuno.imports = builtins.attrValues self.homeModules;
          sharedModules = [
            inputs.nvf.homeModules.default
          ];
        };
      }
    ];
  };
}
