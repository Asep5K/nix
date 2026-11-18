{ pkgs, ... }:

{
    imports = [
        #  ./niri
        ./nvf
        ./shell
        ./fastfetch.nix
        ./foot.nix
        ./fzf.nix
        ./git.nix
        ./gpg.nix
        ./hypridle.nix
        ./hyprlock.nix
        ./mpv.nix
        ./starship.nix
        ./tmux.nix
        ./yazi.nix
    ];
    home = {
        sessionVariables = {
            SUDO_PROMPT = "Passwd!: ";
        };
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
            uv
            flatpak
            cava
        ];
    };
    xdg = {
        enable = true;
        localBinInPath = true;
        mimeApps.enable = true;
        userDirs.enable = true;
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
