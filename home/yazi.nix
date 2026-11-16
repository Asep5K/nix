{ pkgs, ... }:
{
  programs.yazi = {
    enable = true;
    plugins = with pkgs.yaziPlugins; {
      inherit
        git
        full-border
        mime-ext
        chmod
        ;
    };
    initLua = ''
      require("git"):setup({order = 1500})
      require("full-border"):setup({set = "rounded"})
      require("mime-ext.local"):setup({fallback_file1 = true})
    '';
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
          desc = "cd => /mnt";
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
            "c"
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
}
