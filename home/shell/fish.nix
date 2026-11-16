{ pkgs, ... }:
{
    programs.fish = {
        enable = true;
        shellAliases = {
            eza = "eza --color";
            ll = "eza -l";
            la = "eza -la";
            doas = "sudo";
            nrs = "sudo nixos-rebuild switch";
            nrb = "sudo nixos-rebuild build";
        };
        plugins = [
            {
                name = "autoPair";
                src = pkgs.fishPlugins.autopair.src;
            }
            {
                name = "colored-man-pages";
                src = pkgs.fishPlugins.colored-man-pages;
            }
            {
                name = "sudope";
                src = pkgs.fishPlugins.plugin-sudope;
            }
            {
                name = "fzf-fish";
                src = pkgs.fishPlugins.fzf-fish;
            }
        ];
    };
}
