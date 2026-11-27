{
  flake.homeModules.gtk = { pkgs, ... }: {
    gtk = {
      enable = true;
      theme = {
        name = "catppuccin";
        package = pkgs.catppuccin-gtk;
      };
    };
  };
}
