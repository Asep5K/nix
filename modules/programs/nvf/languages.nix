{
  flake.homeModules.nvf-languages = {
    programs.nvf.settings = {
      vim.languages = {
        enableTreesitter = true;
        enableFormat = true;
        nix = {
          enable = true;
          format.enable = true;
          treesitter.enable = true;
        };
        bash = {
          enable = true;
          format.enable = true;
        };
        # rust = {
        #   enable = true;
        #   lsp.enable = false;
        #   extensions.rustaceanvim.enable = true;
        # };
        markdown = {
          enable = true;
          extensions.markview-nvim = {
            enable = true;
            setupOpts = {
              lazy = true;
            };
          };
        };
        python = {
          enable = true;
          lsp.servers = [
            "ty"
            "ruff"
          ];
          extraDiagnostics.enable = false;
          format.type = [
            "ruff-fix"
            "ruff"
          ];
        };
      };

      vim.formatter.conform-nvim = {
        enable = true;
        presets = {
          nixfmt.enable = true;
          shfmt.enable = true;
          ruff.enable = true;
          ruff-fix.enable = true;
          ruff-organize-imports.enable = true;
        };
        setupOpts = {
          default_format_opts = {
            lsp_format = "fallback";
            stop_after_first = true;
          };
          format_on_save = {
            timeout_ms = 1000;
          };
          formatters_by_ft = {
            nix = ["nixfmt"];
            sh = ["shfmt"];
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
        presets = {
          ty.enable = true;
          ruff.enable = true;
          bash-language-server.enable = true;
          # rust-analyzer.enable = true;
        };
      };
    };
  };
}
