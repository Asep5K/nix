{ pkgs, ... }:

{
    imports = [
        #  ./niri # MALAS soalnya dokumentasi nya belom jelas jadi malas!!!
        ./hypr
        ./nvf
        ./shell
        ./fastfetch.nix
        ./foot.nix
        ./fzf.nix
        ./git.nix
        ./gpg.nix
        ./mpv.nix
        ./starship.nix
        ./tmux.nix
        ./yazi.nix
    ];
    home = {
        sessionVariables = {
            SUDO_PROMPT = "Passwd!: "; # Biar prompt sudo mu gak gitu gitu aja!!
        };
        username = "iuno"; # my bini LoL
        homeDirectory = "/home/iuno";
        stateVersion = "26.05";
        packages = with pkgs; [
            nil # nix language server atau apalah intinya itu wir!!
            btop # buat jadi hengker" an
            ripgrep # alternatif grep
            fd # alternatif find
            cliphist # clipboard itu lah intinya
            wl-clipboard # clipboard juga
            jq # jq buat anuin json (who is json?)
            rofi # launcher drun
            eww # bar (foo bar)
            eza # ls tapi lebih modern
            kew # Music player
            playerctl # buat controll music
            awww # wallpaper daemon
            mako # notify
            hyprlock # buat lock laptop
            hypridle # idle daemon
            yt-dlp # buat download bokep
            vesktop # alternarif discord
            librewolf # browser buat nonton bokep
            brightnessctl # buat atur brightness
            python3 # buat apa aja
            libnotify # buat ngirim notify
            chafa # Buat anuin gambar di terminal
            wf-recorder # Buat record layar pas nonton bokep
            ffmpeg # buat compress video bokep
            file # iykyk
            exiftool # iykyk
            bitwarden-desktop # manajeman password akun bokep
            flatpak # iykyk
            cava # iykyk

            # font
            jetbrains-mono # JetBrainsMono
            maple-mono.NF # Maple Mono
        ];
    };
    xdg = {
        enable = true;
        localBinInPath = true;
        mimeApps.enable = true;
        userDirs.enable = true;
    };
    programs = {
        zoxide.enable = true; # z
        yambar.enable = true;
        bat = {
            # cat tapi lebih keren
            enable = true;
            config = {
                theme = "Catppuccin Mocha";
                paging = "never";
            };
        };
    };
    services.playerctld.enable = true;
}
# vim: list nowrap
