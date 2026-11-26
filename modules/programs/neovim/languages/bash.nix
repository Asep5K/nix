{
  flake.homeModules.nvf-bash = {
    programs.nvf.settings.vim = {
      languages.bash = {
        enable = true;
        format.enable = true;
        extraDiagnostics.enable = true;
        lsp.enable = true;
        treesitter.enable = true;
      };
      formatter.conform-nvim = {
        enable = true;
        presets.shfmt.enable = true;
        setupOpts.formatters_by_ft.sh = [
          "shfmt"
          "beautysh"
        ];
      };
      lsp.presets.bash-language-server.enable = true;
    };
  };
}
