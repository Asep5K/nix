{
    flake.homeModules.iuno =
        { pkgs, pkgs-unstable, ... }:
        {
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
                    eww # bar (foo bar)
                    eza # ls tapi lebih modern
                    pkgs-unstable.kew # Music player
                    playerctl # buat controll music
                    awww # wallpaper daemon
                    yt-dlp # buat download bokep
                    telegram-desktop # instant mess
                    vesktop # alternarif discord
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
                    swayimg # buat liat foto

                    # esesha
                    sshfs

                    xwayland-satellite # dependensi niri

                    # font
                    nerd-fonts.jetbrains-mono # JetBrainsMono
                    maple-mono.NF # Maple Mono
                    noto-fonts-color-emoji
                ];
            };
            programs = {
                gcc.enable = true; # GNU Compiler Collection;
                rbw.enable = true;
                wofi.enable = true; # alternatif rofi wayland
                zoxide.enable = true; # z

                librewolf = {
                    # browser buat nonton bokep
                    enable = true;
                    settings = {
                        "privacy.sanitize.sanitizeOnShutdown" = false;
                        "browser.tabs.min_inactive_duration_before_unload" = 300000;
                        "browser.toolbars.bookmarks.visibility" = "never";
                        "browser.tabs.hoverPreview.showThumbnails" = false;
                        "sidebar.verticalTabs" = true;
                    };
                };

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
        };
}
# vim: list nowrap
