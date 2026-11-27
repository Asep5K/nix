{
  flake.homeModules.foot =
    { lib, config, ... }:
    let
      h = lib.removePrefix "#";
      m = config.theme.palettes.mocha;
      l = config.theme.palettes.latte;
    in
    {
      programs.foot = {
        enable = true;
        server.enable = true;
        settings = {
          main = {
            font = "JetBrainsMono Nerd Font Mono:size=10";
            dpi-aware = "yes";
          };
          mouse = {
            hide-when-typing = "yes";
            alternate-scroll-mode = "yes";
          };
          cursor = {
            style = "beam";
            blink = "yes";
            beam-thickness = 2;
          };
          key-bindings = {
            quit = "none";
            pipe-scrollback = "[wl-copy] Control+Shift+a";
            pipe-command-output = "[wl-copy] Control+Shift+g";
            color-theme-toggle = "Control+Shift+t";
          };
          url = {
            launch = "xdg-open \${url}";
            label-letters = "sadfjklewcmpgh";
            style = "dashed";
            osc8-underline = "url-mode";
            regex = ''(((https?://|mailto:|ftp://|file:|ssh:|ssh://|git://|tel:|magnet:|ipfs://|ipns://|gemini://|gopher://|news:)|www\.)([0-9a-zA-Z:/?#@!$&*+,;=.~_%^\-]+|\([]\["0-9a-zA-Z:/?#@!$&'*+,;=.~_%^\-]*\)|\[[\(\)"0-9a-zA-Z:/?#@!$&'*+,;=.~_%^\-]*\]|"[]\[\(\)0-9a-zA-Z:/?#@!$&'*+,;=.~_%^\-]*"|'[]\[\(\)0-9a-zA-Z:/?#@!$&*+,;=.~_%^\-]*')+([0-9a-zA-Z/#@$&*+=~_%^\-]|\([]\["0-9a-zA-Z:/?#@!$&'*+,;=.~_%^\-]*\)|\[[\(\)"0-9a-zA-Z:/?#@!$&'*+,;=.~_%^\-]*\]|"[]\[\(\)0-9a-zA-Z:/?#@!$&'*+,;=.~_%^\-]*"|'[]\[\(\)0-9a-zA-Z:/?#@!$&*+,;=.~_%^\-]*'))'';
          };
          colors-dark = {
            cursor = "${h m.crust} ${h m.rosewater}";
            foreground = h m.text;
            background = h m.base;

            regular0 = h m.surface1;
            regular1 = h m.red;
            regular2 = h m.green;
            regular3 = h m.yellow;
            regular4 = h m.blue;
            regular5 = h m.pink;
            regular6 = h m.teal;
            regular7 = h m.subtext1;

            bright0 = h m.surface2;
            bright1 = h m.red;
            bright2 = h m.green;
            bright3 = h m.yellow;
            bright4 = h m.blue;
            bright5 = h m.pink;
            bright6 = h m.teal;
            bright7 = h m.subtext0;

            "16" = h m.peach;
            "17" = h m.rosewater;

            selection-foreground = h m.text;
            selection-background = "414356"; # bukan warna palet, tetap hardcode

            search-box-no-match = "${h m.crust} ${h m.red}";
            search-box-match = "${h m.text} ${h m.surface0}";

            jump-labels = "${h m.crust} ${h m.peach}";
            urls = h m.blue;
          };

          colors-light = {
            cursor = "${h l.base} ${h l.rosewater}";
            foreground = h l.text;
            background = h l.base;

            regular0 = h l.subtext1;
            regular1 = h l.red;
            regular2 = h l.green;
            regular3 = h l.yellow;
            regular4 = h l.blue;
            regular5 = h l.pink;
            regular6 = h l.teal;
            regular7 = h l.surface2;

            bright0 = h l.subtext0;
            bright1 = h l.red;
            bright2 = h l.green;
            bright3 = h l.yellow;
            bright4 = h l.blue;
            bright5 = h l.pink;
            bright6 = h l.teal;
            bright7 = h l.surface1;

            "16" = h l.peach;
            "17" = h l.rosewater;

            selection-foreground = h l.text;
            selection-background = "ccced7"; # bukan warna palet, tetap hardcode

            search-box-no-match = "${h l.crust} ${h l.red}";
            search-box-match = "${h l.text} ${h l.surface0}";

            jump-labels = "${h l.crust} ${h l.peach}";
            urls = h l.blue;
          };
        };
      };
    };
}
# vi: nowrap
