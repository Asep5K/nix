{ pkgs, ... }:
{
    programs.fish = {
        enable = true;
        shellAliases = {
            eza = "eza --color=always --icons=always";
            ll = "eza -l";
            la = "eza -la";
            doas = "sudo";
            nrs = "sudo nixos-rebuild switch";
            nrb = "sudo nixos-rebuild build";
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
                name = "colored-man-pages";
                src = pkgs.fishPlugins.colored-man-pages.src;
            }
            {
                name = "sudope";
                src = pkgs.fishPlugins.plugin-sudope.src;
            }
        ];
    };
}
