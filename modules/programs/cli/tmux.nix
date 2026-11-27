{
  flake.homeModules.tmux = { config, ... }: {
    programs.tmux = {
      enable = true;
      mouse = true;
      # prefix = "C-b";
      shortcut = "a";
      keyMode = "vi";
      terminal = "xterm-256color";
      escapeTime = 0;
      extraConfig =
        let
          c = config.theme.palette;
        in
        ''
          # reload config
          unbind r
          bind r source-file ~/.config/tmux/tmux.conf
          # Open new windows in current path
          unbind N
          bind N new-window -c "#{pane_current_path}"

          # Open new panes in current path
          unbind H
          bind H split-window -h -c "#{pane_current_path}"
          unbind V
          bind V split-window -v -c "#{pane_current_path}"

          # Rename current window & session
          unbind W
          bind W command-prompt -I "#W" { rename-window "%%" }
          unbind S
          bind S command-prompt -I "#S" { rename-session "%%" }

          # Close current window
          unbind Q
          bind Q confirm-before -p "kill-window #W? (y/n)" kill-window

          set -g window-status-separator "|"
          set -g status-left-length 0
          set -g status-left " #{?client_prefix,#[fg=${c.red}],#{?#{==:#{pane_mode},copy-mode},#[fg=${c.yellow}],#[fg=${c.green}]}}TMUX #[fg=${c.surface1} bold]| "
          set -g status-right "#[fg=#{@thm_peach} bold] [#S] #[fg=#{@thm_fg} bold]| "
          set -ga status-right "#[fg=${c.sky}]󰃰 %a %d/%m/%Y ~ %H:%M "
          set -g base-index 1
          set -g pane-base-index 1
          set -g set-clipboard on
          set -g terminal-overrides ",*:RGB"
          set -g renumber-windows on
        '';
    };
  };
}
# vi: nowrap
