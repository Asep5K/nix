{
  flake.homeModules.mpv =
    {
      lib,
      pkgs,
      pkgs-unstable,
      config,
      ...
    }:
    {
      programs.mpv = {
        enable = true;
        config = {
          cache = "yes";
          vo = "gpu-next";
          gpu-context = "x11egl";
          hwdec = "h264-vaapi";
          profile = "fast";
          icc-profile-auto = "no";
          scale = "bilinear";
          cscale = "bilinear";
          dscale = "bilinear";

          correct-downscaling = "yes"; # Mematikan protes log "non-bilinear scaler"

          # OSD & UI
          osc = "no"; # yes";
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
          screenshot-directory = "${config.xdg.userDirs.pictures}/mpv-screenshots";
          screenshot-template = "%f-%wH.%wM.%wS.%wT-#%#00n";

          # HIST
          save-watch-history = "yes";
          write-filename-in-watch-later-config = "yes";
          watch-later-dir = "${config.xdg.stateHome}/mpv/watchlater";
          watch-later-options-remove = "sub-pos";
          save-position-on-quit = "yes";

          # MISC
          keep-open = "no";
          reset-on-next-file = "pause";
          fullscreen = "no";

          # Y
          ytdl-format = "bestvideo[vcodec^=avc1]+bestaudio[ext=m4a]/best[vcodec^=avc1]/best";
        };
        includes = [
          (toString (
            pkgs.fetchurl {
              url = "https://raw.githubusercontent.com/catppuccin/mpv/7cb94023a922b3253b018b6add464846152ab6ea/themes/mocha/mauve.conf";
              hash = "sha256-t+TotYyovSKFmLJRx8+XagwgQOBLiEGufom5ni0KkrA=";
            }
          ))
        ];
        scripts = with pkgs-unstable; [
          mpvScripts.builtins.autoload
          mpvScripts.sponsorblock-minimal
          mpvScripts.modernz
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
        scriptOpts = {
          sponsorblock_minimal = {
            hash = true;
            categories = "sponsor;selfpromo;interaction;intro;outro;preview;hook";
            server = "https://sponsor.ajay.app/api/skipSegments";
          };
          modernz =
            let
              c = config.theme.palette;
              text = c.text;
              mauve = c.mauve;
            in
            {
              # Language and display
              language = "default";
              layout = "default";
              icon_theme = "fluent";
              icon_style = "mixed";
              font = "mpv-osd-symbols";

              idlescreen = true;
              window_top_bar = "auto";
              showwindowed = true;
              showfullscreen = true;
              showonselect = false;
              showonpause = true;
              keeponpause = "no";
              greenandgrumpy = false;

              # OSC behaviour and scaling
              hidetimeout = 1500;
              keep_with_cursor = true;
              fadeduration = 200;
              fadein = true;
              minmousemove = 0;
              deadzonesize = 0.75;
              deadzone_hide = "instant";
              osc_on_seek = true;
              osc_on_start = "both";
              mouse_seek_pause = true;
              force_seek_tooltip = false;

              vidscale = "auto";
              scalewindowed = 1.0;
              scalefullscreen = 1.0;

              # Elements display
              show_title = true;
              title = "\${media-title}";
              title_font_size = 24;
              truncate_title = false;
              chapter_title_font_size = 16;
              cache_info = false;
              cache_info_speed = false;
              cache_info_font_size = 12;

              show_chapter_title = true;
              chapter_above_title = false;
              chapter_fmt = "%s";

              timecurrent = true;
              timems = false;
              unicodeminus = false;
              time_format = "dynamic";
              time_font_size = 16;
              tooltip_font_size = 14;
              speed_font_size = 16;

              # Title bar settings
              show_window_title = false;
              window_title_font_size = 26;
              window_controls = true;
              windowcontrols_independent = true;

              # Subtitle and OSD display settings
              sub_margins = true;
              osd_margins = false;
              dynamic_margins = true;

              # Buttons display and functionality
              subtitles_button = true;
              audio_tracks_button = true;
              jump_buttons = true;
              jump_amount = 10;
              jump_more_amount = 60;
              jump_icon_number = true;
              jump_mode = "relative";
              jump_softrepeat = true;
              chapter_skip_buttons = false;
              track_nextprev_buttons = true;

              volume_control = true;
              volume_control_type = "linear";
              volumebar_unmute_on_click = false;
              playlist_button = true;
              hide_empty_playlist_button = false;
              gray_empty_playlist_button = false;

              fullscreen_button = true;
              info_button = true;
              ontop_button = true;
              ontop_in_topbar = false;
              screenshot_button = true;

              download_button = true;
              download_path = "~~desktop/mpv";

              loop_button = true;
              shuffle_button = false;
              speed_button = true;

              buttons_always_active = "none";

              playpause_size = 28;
              midbuttons_size = 24;
              sidebuttons_size = 24;

              zoom_control = true;
              zoom_in_max = 4;
              zoom_out_min = -1;

              # Colors and style
              osc_color = "#000000";
              window_title_color = text;
              window_controls_color = text;
              windowcontrols_close_hover = "#F45C5B";
              windowcontrols_max_hover = "#F8BC3A";
              windowcontrols_min_hover = "#43CB44";
              title_color = text;
              cache_info_color = text;
              seekbar_cache_color = "#B1B1B1";
              seekbarfg_color = mauve;
              seekbarbg_color = "#999999";
              seek_handle_color = c.lavender;
              seek_handle_border_color = mauve;
              volumebar_match_seek_color = false;
              time_color = text;
              chapter_title_color = text;
              side_buttons_color = text;
              middle_buttons_color = text;
              playpause_color = text;
              held_element_color = "#999999";
              hover_effect_color = c.sky;
              thumbnail_box_color = "#111111";
              thumbnail_box_outline = "#404040";
              nibble_color = mauve;
              nibble_current_color = text;
              ab_loop_color = "#2596be";

              osc_fade_strength = 100;
              fade_blur_strength = 100;
              fade_transparency_strength = 0;
              window_fade_strength = 100;
              window_fade_blur_strength = 100;
              window_fade_transparency_strength = 0;
              thumbnail_box_padding = 4.5;
              thumbnail_box_radius = 4;
              thumbnail_box_outline_size = 1;

              # Button interaction settings
              hover_effect = "size,glow,color,box";
              button_hover_size = 115;
              button_held_size = 100;
              button_held_box_alpha = 18;
              button_glow_amount = 5;
              slider_hover_size = 100;
              tooltip_hints = true;

              # Progress bar settings
              seek_handle_size = 0.8;
              seek_handle_border_size = 0.42;
              seek_handle_border_hover_size = 0.31;
              seekbar_height = "medium";
              seekrange = true;
              seekrangealpha = 150;
              livemarkers = true;
              seekbarkeyframes = true;
              slider_rounded_corners = true;

              nibbles_style = "gap";
              nibbles_top = true;
              nibbles_bottom = true;

              automatickeyframemode = true;
              automatickeyframelimit = 600;

              persistent_progress = false;
              persistent_progress_height = 17;
              persistent_buffer = false;

              # Miscellaneous settings
              visibility = "auto";
              visibility_modes = "never_auto_always";
              tick_delay = 0.0167;
              tick_delay_follow_display_fps = false;

              # Elements Position
              title_offset = 20;
              title_with_chapter_offset = 5;
              chapter_title_offset = 18;
              chapter_above_title_offset = 3;
              time_codes_offset = 0;
              tooltip_height_offset = 5;
              portrait_window_trigger = 950;
              hide_volume_bar_trigger = 1150;
              osc_height = 60;

              # Mouse commands
              title_mbtn_left_command = "script-binding stats/display-page-5";
              title_mbtn_mid_command = "show-text \${path}";
              title_mbtn_right_command = "script-binding select/select-watch-history";

              chapter_title_mbtn_left_command = "script-binding select/select-chapter";
              chapter_title_mbtn_right_command = "show-text \${chapter-list} 3000";

              seekbar_wheel_up_command = "seek 10";
              seekbar_wheel_down_command = "seek -10";

              playlist_mbtn_left_command = "script-binding select/select-playlist";
              playlist_mbtn_right_command = "script-binding select/menu";

              vol_ctrl_mbtn_left_command = "no-osd cycle mute";
              vol_ctrl_mbtn_right_command = "script-binding select/select-audio-device";
              vol_ctrl_wheel_down_command = "osd-msg add volume -5";
              vol_ctrl_wheel_up_command = "osd-msg add volume 5";
              volumebar_wheel_down_command = "osd-msg add volume -5";
              volumebar_wheel_up_command = "osd-msg add volume 5";

              audio_track_mbtn_left_command = "script-binding select/select-aid";
              audio_track_mbtn_mid_command = "cycle audio down";
              audio_track_mbtn_right_command = "cycle audio";
              audio_track_wheel_down_command = "cycle audio";
              audio_track_wheel_up_command = "cycle audio down";

              sub_track_mbtn_left_command = "script-binding select/select-sid";
              sub_track_mbtn_mid_command = "cycle sub down";
              sub_track_mbtn_right_command = "cycle sub";
              sub_track_wheel_down_command = "cycle sub";
              sub_track_wheel_up_command = "cycle sub down";

              play_pause_mbtn_left_command = "cycle pause";
              play_pause_mbtn_mid_command = "cycle-values loop-playlist inf no";
              play_pause_mbtn_right_command = "cycle-values loop-file inf no";

              chapter_prev_mbtn_left_command = "add chapter -1";
              chapter_prev_mbtn_mid_command = "show-text \${chapter-list} 3000";
              chapter_prev_mbtn_right_command = "script-binding select/select-chapter";

              chapter_next_mbtn_left_command = "add chapter 1";
              chapter_next_mbtn_mid_command = "show-text \${chapter-list} 3000";
              chapter_next_mbtn_right_command = "script-binding select/select-chapter";

              playlist_prev_mbtn_left_command = "playlist-prev";
              playlist_prev_mbtn_mid_command = "show-text \${playlist} 3000";
              playlist_prev_mbtn_right_command = "script-binding select/select-playlist";

              playlist_next_mbtn_left_command = "playlist-next";
              playlist_next_mbtn_mid_command = "show-text \${playlist} 3000";
              playlist_next_mbtn_right_command = "script-binding select/select-playlist";

              fullscreen_mbtn_left_command = "cycle fullscreen";
              fullscreen_mbtn_right_command = "cycle window-maximized";

              info_mbtn_left_command = "script-binding stats/display-page-1-toggle";

              ontop_mbtn_left_command = "osd-msg cycle ontop";

              screenshot_mbtn_left_command = "osd-msg screenshot video";

              file_loop_mbtn_left_command = "osd-msg cycle-values loop-file inf no";
              file_loop_mbtn_right_command = "osd-msg cycle-values loop-playlist inf no";

              speed_mbtn_left_command = "osd-msg add speed 1";
              speed_mbtn_right_command = "osd-msg set speed 1";
              speed_wheel_down_command = "osd-msg add speed -0.25";
              speed_wheel_up_command = "osd-msg add speed 0.25";
            };
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
      xdg.configFile."mpv/fonts/modernz-icons.ttf".source =
        "${pkgs-unstable.mpvScripts.modernz}/share/fonts/truetype/modernz-icons.ttf"; # font icon buat modernz
    };
}
# vi: nowrap
