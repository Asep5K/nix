{
  flake.nixosModules.hyprland = { pkgs-unstable, ... }: {
    programs.hyprland = {
      enable = false;
    };
  };
}
