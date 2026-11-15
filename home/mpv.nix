{ lib, ... }:
{
  programs.mpv = {
    enable = true;
    config = {
      cache = "yes";
      vo = "gpu";
      gpu-context = "wayland";
      hwdec = "vaapi";
      profile = "fast";
      icc-profile-auto = "no";
      scale = "bilinear";
      cscale = "bilinear";
      dscale = "bilinear";

      correct-downscaling = "yes"; # Mematikan protes log "non-bilinear scaler"

      # OSD & UI
      osc = "yes";
      osd-bar = "yes";
      osd-level = 1;
      osd-duration = 1000;
      # osd-font='Netflix Sans Light'
      cursor-autohide = 300;
      cursor-autohide-fs-only = "yes";

      # AUDIO
      ao = "pipewire";
      volume = 50;
      audio-pitch-correction = "no";

      # SCREENSHOOT
      screenshot-format = "png";
      screenshot-high-bit-depth = "no";
      screenshot-png-compression = 1;
      screenshot-directory = "~/Pictures/mpv-screenshots";
      screenshot-template = "%f-%wH.%wM.%wS.%wT-#%#00n";

      # HIST
      save-watch-history = "yes";
      write-filename-in-watch-later-config = "yes";
      watch-later-dir = "~/.cache/mpv/watchlater";
      save-position-on-quit = "yes";

      # MISC
      keep-open = "no";
      reset-on-next-file = "pause";
      fullscreen = "no";
    };
    profiles =
      (lib.genAttrs [ "360" "480" "720" "1080" ] (res: {
        ytdl-format = "bestvideo[vcodec^=avc1][height<=${res}]+bestaudio[ext=m4a]/best[vcodec^=avc1][height<=${res}]/best";
      }))
      // {
        music = {
          vo = "null";
          ytdl-format = "ba/b";
        };
      };
  };
}
# vi: nowrap
