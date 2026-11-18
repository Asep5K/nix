{ pkgs, ... }:
{
    imports = [
        ./binds.nix
        ./layout.nix
        ./windowrule.nix
    ];
    wayland.windowManager.niri = {
        enable = true;
        portalPackage = pkgs.xdg-desktop-portal-gtk;

        settings = {
            screenshot-path = "~/Pictures/Screenshots/%Y-%m-%d_%H-%M-%S.png";
            prefer-no-csd = { };
            hotkey-overlay = {
                "skip-at-startup" = true;
            };
            cursor = {
                xcursor-theme = "Future-cursors";
                xcursor-size = 60;
                hide-after-inactive-ms = 5000;
            };
            environment = {
                MOZ_ENABLE_WAYLAND = "1";
            };
            spawn-sh-at-startup = [
                "exec wl-paste --type image --watch cliphist store"
            ];
            spawn-at-startup = [
                {
                "~/.config/niri/scripts/bar.sh";
                }{

                "~/.config/niri/scripts/wallpaper.sh";
                }
            ];
        };
    };
}

# vi: nowrap
