{
  flake.homeModules.iuno =
    {
      pkgs,
      pkgs-unstable,
      config,
      ...
    }:
    {
      home = {
        sessionVariables = {
          MOZ_ENABLE_WAYLAND = 1;
          QT_WAYLAND_DISABLE_WINDOWDECORATION = 1;
        };
        username = "iuno"; # my bini LoL
        homeDirectory = "/home/iuno";
        stateVersion = "26.05";
        packages = with pkgs; [
          ripgrep # alternatif grep
          fd # alternatif find
          wl-clipboard # clipboard juga
          eww # bar (foo bar)
          pkgs-unstable.kew # Music player
          playerctl # buat controll music
          # awww # wallpaper daemon
          pkgs-unstable.yt-dlp # buat download bokep
          telegram-desktop # instant mess
          vesktop # alternarif discord
          brightnessctl # buat atur brightness
          libnotify # buat ngirim notify
          chafa # Buat anuin gambar di terminal
          wf-recorder # Buat record layar pas nonton bokep
          pkgs-unstable.ffmpeg # buat compress video bokep
          file # iykyk
          exiftool # iykyk
          bitwarden-desktop # manajeman password akun bokep
          flatpak # iykyk
          swayimg # buat liat foto
          rbw
          nitch
          #rifu
          imagemagick

          # esesha
          sshfs

          xwayland-satellite # dependensi niri

          # font
          nerd-fonts.jetbrains-mono # JetBrainsMono
          maple-mono.NF # Maple Mono
          noto-fonts-color-emoji

          # apaaja
          #  libva-utils
        ];
      };
      programs = {
        zoxide.enable = true;
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
      };
      fonts.fontconfig = {
        enable = true;
        hinting = "full";
        defaultFonts = {
          serif = [
            "Noto Serif"
            "Liberation Serif"
            "Noto Serif CJK JP"
          ];
          sansSerif = [
            "Noto Sans"
            "Liberation Sans"
            "Noto Sans CJK JP"
          ];
          monospace = [
            "JetBrains Mono NF"
            "Noto Sans Mono"
            "Noto Sans Mono CJK JP"
          ];
          emoji = [
            "Noto Color Emoji"
          ];
        };
      };
      services = {
        awww.enable = true;
        cliphist.enable = true; # clipboward
        playerctld.enable = true;
      };
    };
}
# vim: list nowrap
