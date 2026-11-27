{
  flake.homeModules.gtk =
    { pkgs, config, ... }:
    let
      f = config.theme.flavor;
    in
    {
      gtk = {
        enable = true;
        colorScheme = "dark"; # or "light";
        theme = {
          name = "catppuccin-mocha-lavender-standard";
          package = pkgs.catppuccin-gtk.override {
            variant = f;
            accents = [ "lavender" ];
            size = "standard";
          };
        };
        iconTheme = {
          name = "Papirus-Dark";
          package = pkgs.catppuccin-papirus-folders.override {
            flavor = f;
            accent = "lavender";
          };
        };
      };
    };
}
# vi: nowrap
