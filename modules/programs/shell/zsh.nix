{
  flake.nixosModules.zsh = {
    programs.zsh = {
      enable = true;
      enableGlobalCompInit = false;
    };
  };
  flake.homeModules.zsh = {
    pkgs,
    config,
    ...
  }: {
    programs.zsh = {
      enable = true;
      dotDir = "${config.xdg.configHome}/zsh";
      #enableGlobalCompInit = false;
      profileExtra = ''
        umask 022

        [ -r "$HOME/.profile" ] && emulate sh -c '. $HOME/.profile'

      '';
      initContent = ''
        if [ -r "${config.programs.zsh.dotDir}/custom.zsh" ]; then
            source "${config.programs.zsh.dotDir}/custom.zsh"
        fi
        [ -f "$ZDOTDIR/.env" ] && . "$ZDOTDIR/.env"
        zle_highlight=(paste:none)
      '';
      envExtra = ''
        if [[ "$TERM" = "foot" || "$TERMINAL" = "foot" ]]; then
            autoload  -U add-zsh-hook
            _foot_osc7() {
              local PWD="''${PWD// /%20}"
              printf "\033]7;file://%s%s\033\\" "$HOST" "$PWD"
            }
            _foot_osc133() {
              printf "\033]133;%s\033\\" "$1"
            }
            _foot_preexec() {
              _foot_osc133 C
            }
            _foot_precmd() {
               _foot_osc133 D
              _foot_osc133 A
            }
            add-zsh-hook chpwd _foot_osc7
            add-zsh-hook preexec _foot_preexec
            add-zsh-hook precmd _foot_precmd
        fi

        # disable sort when completing `git checkout`
        zstyle ':completion:*:git-checkout:*' sort false
        # # set descriptions format to enable group support
        zstyle ':completion:*:descriptions' format '[%d]'
        # # set list-colors to enable filename colorizing
        zstyle ':completion:*' list-colors ''${(s.:.)LS_COLORS}
        # # preview directory's content with exa when completing cd
        zstyle ':fzf-tab:complete:ls:*' fzf-preview 'eza -1 --color=always $realpath'
        zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
        # switch group using `<` and `>`
        zstyle ':fzf-tab:*' switch-group '<' '>'
      '';
      shellAliases = {
        ydl = "yt-dlp";
        btw = "echo i use nixos btw";
        nrs = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles#nixosbtw";
        nrb = "sudo nixos-rebuild build --flake ~/nixos-dotfiles#nixosbtw";
        nrt = "sudo nixos-rebuild test --flake ~/nixos-dotfiles#nixosbtw";
        nrdb = "sudo nixos-rebuild dry-build --flake ~/nixos-dotfiles#nixosbtw";
        doas = "sudo";
        wlp = "wl-paste";
        wlc = "wl-copy";
        rm = "rm -i";
        cp = "cp -i";
        mv = "mv -i";
        mkdir = "mkdir -p";
        chx = "chmod +x";
        cpr = "cp --recursive";
        tree = "eza -T";
        eza = "eza --icons=always";
        ll = "eza -l";
        la = "eza -la";
        T = "eza -T";
        t = "tail -f";
        rtfm = "man";
      };
      setOptions = [
        "NOHUP"
        "AUTOCD"
        "APPEND_HISTORY"
        "INC_APPEND_HISTORY"
        "SHARE_HISTORY"
        "HIST_SAVE_BY_COPY"
        "HIST_NO_FUNCTIONS"
        "HIST_IGNORE_ALL_DUPS"
        "HIST_SAVE_NO_DUPS"
        "HIST_REDUCE_BLANKS"
        "INTERACTIVE_COMMENTS"
      ];
      sessionVariables = {
        EDITOR = "nvim";
        PS1 = " ";
      };
      localVariables = {
        HISTDUP = "erase";
        HIST_STAMPS = "mm/dd/yyyy";

        # zsh-autosuggestion
        ZSH_AUTOSUGGEST_USE_ASYNC = "true";
        ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE = 20;
      };
      history = {
        path = "${config.xdg.cacheHome}/zsh_history";
        saveNoDups = true;
        ignoreAllDups = true;
      };
      defaultKeymap = "viins";
      autosuggestion = {
        enable = true;
        highlight = "fg=#7f849c,underline";
      };
      # syntaxHighlighting.enable = true;
      plugins = [
        {
          name = "zsh-fzf-tab";
          src = "${pkgs.zsh-fzf-tab}/share/fzf-tab";
          file = "fzf-tab.plugin.zsh";
        }
        {
          name = "zsh-autopair";
          src = "${pkgs.zsh-autopair}/share/zsh/zsh-autopair";
          file = "autopair.zsh";
        }
        {
          name = "fast-syntax-highlighting";
          file = "fast-syntax-highlighting.plugin.zsh";
          src = pkgs.fetchFromGitHub {
            owner = "zdharma-continuum";
            repo = "fast-syntax-highlighting";
            rev = "v1.56";
            sha256 = "sha256-caVMOdDJbAwo8dvKNgwwidmxOVst/YDda7lNx2GvOjY=";
          };
        }
        # {
        #     name = "colored-man-pages";
        #     file = "colored-man-pages.plugin.zsh";
        #     src = pkgs.runCommand "colored-man-pages" { } ''
        #         install -D ${
        #             pkgs.fetchurl {
        #                 url = "https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/400591e71c894063eb08b6cae18ab66c19a1b756/plugins/colored-man-pages/colored-man-pages.plugin.zsh";
        #                 hash = "sha256-3P5fOv2IfHbP97TLkCo3dErR6IEsj+kv7x9KxLWbnPw=";
        #             }
        #         } $out/colored-man-pages.plugin.zsh
        #     '';
        # }
      ];
    };
  };
}
# vi: nowrap
