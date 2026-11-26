{
  flake.homeModules.nvf-languages = {
    programs.nvf.settings = {
      vim.languages = {
        enableTreesitter = true;
        enableFormat = true;
        markdown = {
          enable = true;
          extensions.markview-nvim = {
            enable = true;
            setupOpts = {
              lazy = true;
            };
          };
        };
      };

      vim.formatter.conform-nvim = {
        enable = true;
        setupOpts = {
          default_format_opts = {
            lsp_format = "fallback";
            stop_after_first = true;
          };
          format_on_save = {
            timeout_ms = 1000;
          };
        };
      };

      # lsp
      vim.lsp = {
        enable = true;
        formatOnSave = true;
        lspconfig.enable = true;
        trouble.enable = true;
        inlayHints.enable = true;
        #lightbulb.enable = true;
      };
    };
  };
}
