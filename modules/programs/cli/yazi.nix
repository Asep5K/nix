{
  flake.homeModules.yazi = {
    pkgs,
    pkgs-unstable,
    lib,
    ...
  }: {
    programs.yazi = {
      enable = true;
      package = pkgs-unstable.yazi;
      extraPackages = with pkgs; [
        _7zz
        exiftool
        fd
        ripgrep
        file
        git
        jq
        resvg
        zoxide
        ffmpeg
        wl-clipboard
      ];
      plugins = {
        git = {
          package = pkgs-unstable.yaziPlugins.git;
          setup = true;
          settings.order = 1500;
        };
        full-border = {
          package = pkgs-unstable.yaziPlugins.full-border;
          setup = true;
          settings.set = "rounded";
        };
        mime-ext = {
          package = pkgs-unstable.yaziPlugins.mime-ext;
          setup = true;
          settings.fallback_file1 = lib.generators.mkLuaInline ''require("mime-ext.local"):setup({fallback_file1 = true})'';
        };
        chmod.package = pkgs-unstable.yaziPlugins.chmod;
        exifaudio = {
          package = pkgs.fetchFromGitHub {
            owner = "Sonico98";
            repo = "exifaudio.yazi";
            rev = "4506f9d5032e714c0689be09d566dd877b9d464e";
            hash = "sha256-RWCqWBpbmU3sh/A+LBJPXL/AY292blKb/zZXGvIA5/o=";
          };
        };
      };
      initLua = ''
      '';
      flavors = {
        dracula =
          pkgs.fetchFromGitHub {
            owner = "yazi-rs";
            repo = "flavors";
            rev = "38c08d8eb9ea0d28c8c911a249a08f27ba2151ac";
            sparseCheckout = ["dracula.yazi"];
            hash = "sha256-ZHctWT1pSZiFDOOW1NCqcCPZGmawvGwErCeKDN5EtPs=";
          }
          + "/dracula.yazi";
      };
      theme = {
        flavor = {
          dark = "dracula";
          light = "dracula";
        };
        git = {
          modified = {
            fg = "#f9e2af";
            bold = true;
          };
          deleted = {
            fg = "#f38ba8";
            bg = "#2c191e";
            bold = true;
          };
          untracked = {
            fg = "#94e2d5";
            bold = true;
          };
          staged = {
            fg = "#a6e3a1";
            bold = true;
          };
          ignored = {
            fg = "#6c7086";
            italic = true;
          };
          unknown_sign = " ";
          ignored_sign = "";
          modified_sign = "";
          deleted_sign = "";
          clean_sign = "";
          untracked_sign = "󰞋";
          unstaged_sign = "";
          updated_sign = "󰁯";
          staged_sign = "";
        };
      };
      keymap = {
        mgr.prepend_keymap = [
          {
            run = "cd /";
            on = [
              "g"
              "r"
            ];
            desc = "Go to /";
          }
          {
            run = "cd /mnt";
            on = [
              "g"
              "m"
            ];
            desc = "Go to /mnt";
          }
          {
            run = "cd ~/.local";
            on = [
              "g"
              "l"
            ];
            desc = "Go to ~/.local";
          }
          {
            run = "plugin chmod";
            on = [
              "c"
              "m"
            ];
            desc = "Chmod on selected files";
          }
          {
            run = "cd /tmp";
            on = [
              "g"
              "T"
            ];
            desc = "Go to /tmp";
          }
        ];
      };
      # End of keymap
      settings = {
        plugin = {
          prepend_fetchers = [
            {
              url = "*";
              group = "git";
              run = "git";
            }
            {
              url = "local://*";
              run = "mime-ext.local";
              prio = "high";
              group = "mime";
            }
            {
              url = "remote://*";
              run = "mime-ext.remote";
              prio = "high";
              group = "mime";
            }
          ];
          # End of prepend_fetchers
          prepend_previewers = [
            {
              mime = "audio/*";
              run = "exifaudio";
            }
          ];
          # End of prepend_previewers
        };
      };
      # End of settings.yazi
    };
  };
}
# vi: nowrap
