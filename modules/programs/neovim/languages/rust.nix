{
  flake.homeModules.nvf-rust = {
    programs.nvf.settings.vim = {
      languages.rust = {
        enable = true;
        format.enable = true;
        lsp.enable = true;
        treesitter.enable = true;
      };
      formatter.conform-nvim.presets.rustfmt.enable = true;
    };
  };
}
