{
  flake.nixosModules.ly = {
    lib,
    pkgs-unstable,
    ...
  }: {
    services.displayManager.ly = {
      enable = true;
      package = pkgs-unstable.ly;
      settings = {
        allow_empty_password = false;
        animation = "dur_file";
        dur_file_path = toString (pkgs-unstable.fetchurl {
          name = "blackhole.dur";
          url = "https://codeberg.org/fairyglade/ly-community/raw/commit/2f22cfaf7d17598c8f60f562d56e16d74b6c99ab/animations/dur/blackhole-smooth-240x67.dur";
          hash = "sha256-wo3FzPtngCsg/bRSDTYHQqKnMp4vY+Btm14vakJERBU=";
        });
        vi_mode = true;
        full_color = true;
        bigclock = true;
        bigclock_12_hr = true;
        tty = lib.mkForce 7;
        session_log = ".local/state/ly-session.log";
      };
    };
  };
}
# vi: nowrap
