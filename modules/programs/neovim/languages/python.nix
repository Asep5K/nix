{
  flake.homeModules.nvf-python = {
    programs.nvf.settings.vim = {
      languages.python = {
        enable = true;
        lsp.enable = true;
        treesitter.enable = true;
        lsp.servers = [
          "ty"
          "ruff"
        ];
        extraDiagnostics.enable = false;
        format = {
          enable = true;
          type = [
            "ruff-fix"
            "ruff"
          ];
        };
      };

      formatter.conform-nvim = {
        enable = true;
        presets = {
          ruff.enable = true;
          ruff-fix.enable = true;
          ruff-organize-imports.enable = true;

        };
      };

      lsp = {
        enable = true;
        presets = {
          ty.enable = true;
          ruff.enable = true;
        };
      };
    };
  };
}
