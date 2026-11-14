{ config, ... }:
{
  programs.zsh = {
    enable = true;
    dotDir = "${config.xdg.configHome}/zsh";
    #enableGlobalCompInit = false;
    profileExtra = ''
      umask 022

      [ -r "$HOME/.profile" ] && emulate sh -c '. $HOME/.profile'

      typeset -gx  PATH="$HOME/.local/bin:$PATH"
      typeset -gx  XDG_MUSIC_DIR="$HOME/Music"
      typeset -gx  XDG_CACHE_HOME="$HOME/.cache"
      typeset -gx  XDG_VIDEOS_DIR="$HOME/Videos"
      typeset -gx  XDG_DESKTOP_DIR="$HOME/Desktop"
      typeset -gx  XDG_CONFIG_HOME="$HOME/.config"
      typeset -gx  XDG_PICTURES_DIR="$HOME/Pictures"
      typeset -gx  XDG_DOWNLOAD_DIR="$HOME/Downloads"
      typeset -gx  XDG_PUBLICSHARE_DIR="$HOME/Public"
      typeset -gx  XDG_DATA_HOME="$HOME/.local/share"
      typeset -gx  XDG_STATE_HOME="$HOME/.local/state"
      typeset -gx  XDG_DOCUMENTS_DIR="$HOME/Documents"
      typeset -gx  XDG_TEMPLATES_DIR="$HOME/Templates"
      typeset -gx  EDITOR="nvim"
    '';
    initContent = ''
      source "${config.programs.zsh.dotDir}/zinit.zsh"

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

      zle_highlight=(paste:none)
    '';
    envExtra = ''
      typeset -gx GPG_TTY="''${TTY:-$(tty)}";
      [ -f "$ZDOTDIR/.env" ] && . "$ZDOTDIR/.env"
    '';
    shellAliases = {
      btw = "echo memek";
      nrs = "sudo nixos-rebuild switch";
      doas = "sudo";
      wlp = "wl-paste";
      wlc = "wl-copy";
      rm = "rm -i";
      cp = "cp -i";
      mv = "mv -i";
      mkdir = "mkdir -p";
      chx = "chmod +x";
      cpr = "cp --recursive";
      y = "yazi";
      tree = "eza -T";
      eza = "eza --icons";
      ls = "eza";
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
      SUDO_PROMPT = "Passwd!: ";
      PS1 = " ";
    };
    localVariables = {
      HISTDUP = "erase";
      HIST_STAMPS = "mm/dd/yyyy";
    };
    history = {
      path = "${config.xdg.cacheHome}/zsh_history";
    };
    defaultKeymap = "viins";
  };
}
