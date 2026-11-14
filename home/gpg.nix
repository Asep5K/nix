{ pkgs, ... }:
{
  programs.gpg = {
    enable = true;
    #settings = { # I have no idea };
  };
  services.gpg-agent = {
    enable = true;
    pinentry = {
      program = "pinentry-curses";
      package = pkgs.pinentry-curses;
    };
    enableSshSupport = true;
    extraConfig = ''
      allow-loopback-pinentry
    '';
  };
}
