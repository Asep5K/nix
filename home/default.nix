{ pkgs, ... }:

{
  imports = [
    ./foot.nix
    ./git.nix
    ./fastfetch.nix
    ./hypridle.nix
    ./hyprlock.nix
    ./starship.nix
    ./zsh.nix
    ./gpg.nix
    ./tmux.nix
    ./pkgs.nix
  ];
  home = {
    username = "iuno";
    homeDirectory = "/home/iuno";
    stateVersion = "26.05";
    packages = with pkgs; [
      nil
      fzf
      ripgrep
      fd
      cliphist
      wl-clipboard
      rofi
      eww
      eza
      kew
      playerctl
      awww # wallpaper daemon
      mpv
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
    ];
  };
  programs = {
    zoxide.enable = true;
    bat = {
      enable = true;
      config = {
        theme = "Catppuccin Mocha";
        paging = "never";
      };
    };
  };
}
# vim: noet list nowrap
