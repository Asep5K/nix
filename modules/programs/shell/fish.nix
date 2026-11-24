{
  flake.homeModules.fish = {pkgs, ...}: {
    programs.fish = {
      enable = false;
      shellAliases = {
        T = "eza -T";
        ydl = "yt-dlp";
        ll = "eza -l";
        la = "eza -la";
        doas = "sudo";
        nrs = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles#nixosbtw";
        nrb = "sudo nixos-rebuild build --flake ~/nixos-dotfiles#nixosbtw";
        rm = "rm -i";
        mv = "mv -i";
        cp = "cp -i";
        chx = "chmod +x";
        chr = "chmod 444";
        wlp = "wl-paste";
        wlc = "wl-copy";
        t = "tail -f";
      };
      shellInit = ''
        set -g fish_greeting
        # set -gp PATH $HOME/.local/bin # user path
      '';
      plugins = [
        {
          name = "autoPair";
          src = pkgs.fishPlugins.autopair.src;
        }
        {
          name = "sudope";
          src = pkgs.fishPlugins.plugin-sudope.src;
        }
      ];
      functions = {
        editorconfig = ''
           if test -s .editorconfig
               echo  "file already exists! & will not be overwritten"
              return
          end
          echo "# EditorConfig is awesome: https://EditorConfig.org

          # top-most EditorConfig file
          root = true

          [*]
          indent_style = space
          indent_size = 4
          end_of_line = lf
          charset = utf-8
          trim_trailing_whitespace = true
          insert_final_newline = true
          " > .editorconfig
        '';
      };
    };
  };
}
