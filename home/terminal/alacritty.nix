{
    programs.alacritty = {
        enable = true;
        settings = {
            font = {
                normal = {
                    family = "JetBrainsMono Nerd Font Mono";
                    style = "Regular";
                };
                size = 19.5;
            };
            cursor.style = {
                shape = "beam";
                blinking = "always";
            };
            mouse.hide_when_typing = true;
            terminal.osc52 = "OnlyCopy";

            # Colors (Tokyo Night)
            # Source https//github.com/zatchheems/tokyo-night-alacritty-theme
            colors = {
                primary = {
                    background = "#1a1b26";
                    foreground = "#a9b1d6";
                };
                normal = {
                    black = "#32344a";
                    red = "#f7768e";
                    green = "#9ece6a";
                    yellow = "#e0af68";
                    blue = "#7aa2f7";
                    magenta = "#ad8ee6";
                    cyan = "#449dab";
                    white = "#787c99";
                };
                bright = {
                    black = "#444b6a";
                    red = "#ff7a93";
                    green = "#b9f27c";
                    yellow = "#ff9e64";
                    blue = "#7da6ff";
                    magenta = "#bb9af7";
                    cyan = "#0db9d7";
                    white = "#acb0d0";
                };
            };
        };
    };
}
