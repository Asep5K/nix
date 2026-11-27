{
  flake.homeModules.niri =
    {
      pkgs,
      config,
      ...
    }:
    {
      wayland.windowManager.niri = {
        enable = false;
        portalPackage = pkgs.xdg-desktop-portal-gtk;
        settings = {
          screenshot-path = "~/${config.xdg.userDirs.pictures}/Screenshots/%Y-%m-%d_%H-%M-%S.png";
          prefer-no-csd = { };
          hotkey-overlay = {
            "skip-at-startup" = true;
          };
          cursor = {
            xcursor-theme = "Future-cursors";
            xcursor-size = 60;
            hide-after-inactive-ms = 5000;
          };
        };
      };
    };
}

# vi: nowrap
