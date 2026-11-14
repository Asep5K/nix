{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableGlobalCompInit = false;
  };
}
