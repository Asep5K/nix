{
  flake.homeModules.starship = { lib, config, ... }: {
    programs.starship = {
      enable = true;
      settings = {
        add_newline = false;
        format = lib.concatStrings [
          "$directory"
          "$character"
        ];
        character = {
          format = "$symbol ";
          success_symbol = "[ ](bold italic sapphire)";
          error_symbol = "[ ](bold italic red)";
          vimcmd_symbol = "[   ](italic dimmed mauve)";
        };
        directory = {
          style = "yellow";
          truncation_length = 1;
          truncation_symbol = "../";
        };
        status = {
          disabled = false;
          symbol = " ✘";
        };
        git_status = {
          format = "( [\\[$ahead_behind$stashed\\]]($style))";
          style = "sky";
          stashed = "≡";
          ahead = "⇡\${count}";
          behind = "⇣\${count}";
        };
        palettes = lib.mapAttrs' (
          name: colors: lib.nameValuePair "catppuccin_${name}" colors
        ) config.theme.palettes;
        palette = "catppuccin_${config.theme.flavor}";
        right_format = "$status$cmd_duration$git_branch$git_status";
        continuation_prompt = "[▸▹ ](dimmed lavender)";
        scan_timeout = 10;
      };
    };
  };
}
