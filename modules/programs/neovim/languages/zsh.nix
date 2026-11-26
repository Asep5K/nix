{
  flake.homeModules.nvf-zsh = {
    programs.nvf.settings.vim = {
      languages.zsh = {
        enable = true;
        treesitter.enable = true;
        lsp = {
          enable = true;
          servers = [ "bash-language-server" ];
        };
        format = {
          enable = true;
          type = [ "shfmt" ];
        };
      };
    };
  };
}
