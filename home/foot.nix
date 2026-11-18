{
    programs.foot = {
        enable = true;
        theme = "catppuccin-mocha";
        enableFishIntegration = true;
        settings = {
            main = {
                font = "Maple Mono:size=18";
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
                color-theme-toggle = "Control+shift+t";
            };
            url = {
                launch = "xdg-open \${url}";
                label-letters = "sadfjklewcmpgh";
                style = "dashed";
                osc8-underline = "url-mode";
                regex = ''(((https?://|mailto:|ftp://|file:|ssh:|ssh://|git://|tel:|magnet:|ipfs://|ipns://|gemini://|gopher://|news:)|www\.)([0-9a-zA-Z:/?#@!$&*+,;=.~_%^\-]+|\([]\["0-9a-zA-Z:/?#@!$&'*+,;=.~_%^\-]*\)|\[[\(\)"0-9a-zA-Z:/?#@!$&'*+,;=.~_%^\-]*\]|"[]\[\(\)0-9a-zA-Z:/?#@!$&'*+,;=.~_%^\-]*"|'[]\[\(\)0-9a-zA-Z:/?#@!$&*+,;=.~_%^\-]*')+([0-9a-zA-Z/#@$&*+=~_%^\-]|\([]\["0-9a-zA-Z:/?#@!$&'*+,;=.~_%^\-]*\)|\[[\(\)"0-9a-zA-Z:/?#@!$&'*+,;=.~_%^\-]*\]|"[]\[\(\)0-9a-zA-Z:/?#@!$&'*+,;=.~_%^\-]*"|'[]\[\(\)0-9a-zA-Z:/?#@!$&*+,;=.~_%^\-]*'))'';
            };
        };
    };
}
# vi: nowrap
