{ pkgs, ... }:

{
    imports = [
        ./shell
        ./foot.nix
        ./git.nix
        ./fastfetch.nix
        ./hypridle.nix
        ./hyprlock.nix
        ./starship.nix
        ./gpg.nix
        ./tmux.nix
        ./mpv.nix
        ./yazi.nix
        ./fzf.nix
        ./nvf
    ];
    home = {
        username = "iuno";
        homeDirectory = "/home/iuno";
        stateVersion = "26.05";
        packages = with pkgs; [
            nil
            btop
            ripgrep
            fd
            cliphist
            wl-clipboard
            jq
            rofi
            eww
            eza
            kew
            playerctl
            awww # wallpaper daemon
            mako # notify
            hyprlock
            hypridle
            yt-dlp
            vesktop
            librewolf
            brightnessctl
            python3
            libnotify
            chafa
            wf-recorder
            ffmpeg
            file
            exiftool
            bitwarden-desktop
        ];
    };
    programs = {
        zoxide.enable = true;
        quickshell.enable = true;
        bat = {
            enable = true;
            config = {
                theme = "Catppuccin Mocha";
                paging = "never";
            };
        };
    };
    services.playerctld.enable = true;
}
# vim: noet list nowrap
