{ pkgs, ... }:
{
    programs.nvf = {
        enable = true;
        settings = {
            imports = [
                ./mappings.nix
                ./languages.nix
                ./completion.nix
                ./ui.nix
                ./apaaja.nix
            ];
            vim = {
                viAlias = true;
                vimAlias = true;
                extraPackages = [
                    pkgs.tree-sitter
                    pkgs.wl-clipboard
                ];
                undoFile.enable = true;
                clipboard = {
                    enable = true;
                    providers.wl-copy.enable = true;
                    registers = "unnamedplus";
                };
                # theme
                theme = {
                    enable = true;
                    name = "catppuccin";
                    style = "mocha";
                };
                opts = {
                    tabstop = 8;
                    shiftwidth = 8;
                    expandtab = true;
                    list = true;
                    cursorline = true;
                    cursorlineopt = "screenline";
                };
            };
        };
    };
}
