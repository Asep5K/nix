{inputs, ...}: {
  flake.homeModules.doasedit = {pkgs, ...}: {
    home.packages = [
      inputs.doasedit.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };
}
