{
  flake.homeModules.mpv = {
    lib,
    pkgs,
    ...
  }: {
    programs.mpv = {
      enable = true;
      config = {
        cache = "yes";
        vo = "gpu";
        gpu-context = "x11egl";
        hwdec = "h264-vaapi";
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
        screenshot-directory = "~/Documents/Pictures/mpv-screenshots";
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
      includes = [
        (toString (pkgs.fetchurl {
          url = "https://raw.githubusercontent.com/catppuccin/mpv/7cb94023a922b3253b018b6add464846152ab6ea/themes/mocha/mauve.conf";
          hash = "sha256-t+TotYyovSKFmLJRx8+XagwgQOBLiEGufom5ni0KkrA=";
        }))
      ];
      scripts = with pkgs; [
        mpvScripts.builtins.autoload
        (mpvScripts.buildLua {
          pname = "playlistmanager";
          version = "2eb09e1";
          src = fetchFromGitHub {
            owner = "jonniek";
            repo = "mpv-playlistmanager";
            rev = "2eb09e1e7a2f66549145b728d570fda83703ed86";
            hash = "sha256-NZ6tRq0DLzg1NlpIwbMZPoWQmJZ0cynDuyF5TGazOfc=";
          };
          scriptPath = "playlistmanager.lua";
        })
      ];
      profiles =
        (lib.genAttrs ["360" "480" "720" "1080"] (res: {
          ytdl-format = "bestvideo[vcodec^=avc1][height<=${res}]+bestaudio[ext=m4a]/best[vcodec^=avc1][height<=${res}]/best";
        }))
        // {
          music = {
            vo = "null";
            ytdl-format = "ba/b";
          };
        };
    };
  };
}
# vi: nowrap
