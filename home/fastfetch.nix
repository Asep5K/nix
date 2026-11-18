{
    programs.fastfetch = {
        enable = true;
        settings = {
            logo.type = "small";
            display = {
                separator = " : ";
                bar.char = {
                    elapsed = "󰛞 ";
                    total = " ";
                };
                percent.type = 2;
            };
            modules = [
                {
                    type = "os";
                    key = "    OS";
                    format = "{3}";
                    keyColor = "cyan";
                }
                {
                    type = "kernel";
                    key = "   Kernel";
                    format = "{2}";
                    keyColor = "red";
                }
                {
                    type = "packages";
                    key = "  󰏗 Packages";
                    keyColor = "green";
                }
                {
                    type = "terminal";
                    key = "   Terminal";
                    keyColor = "cyan";
                }
                {
                    type = "wm";
                    key = "  󰍹  Wm";
                    format = "{2} ({3})";
                    keyColor = "cyan";
                }
                {
                    type = "memory";
                    key = "   Memory ";
                    keyColor = "red";
                }
                "break"
            ];
        };
    };
}
