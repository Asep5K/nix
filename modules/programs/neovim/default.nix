{
  flake.nixosModules.neovim = {
    programs = {
      nano.enable = false;
      neovim = {
        enable = true;
        viAlias = true;
        vimAlias = true;
        defaultEditor = true;
      };
    };
  };
  flake.homeModules.nvf = { pkgs, ... }: {
    programs.nvf = {
      enable = true;
      settings = {
        vim = {
          viAlias = true;
          vimAlias = true;
          syntaxHighlighting = true;
          treesitter.enable = true;
          extraPackages = with pkgs; [
            tree-sitter
            wl-clipboard
            ripgrep
            fzf
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
            tabstop = 2;
            shiftwidth = 2;
            expandtab = true;
            list = true;
            cursorline = true;
            cursorlineopt = "screenline";
          };
        };
      };
    };
  };
}
