{
    vim.languages = {
        nix = {
            enable = true;
            lsp.enable = true;
            format.enable = true;
            treesitter.enable = true;
        };
        css = {
            enable = true;
            lsp.enable = true;
        };
        markdown = {
            enable = true;
            extensions.markview-nvim = {
                enable = true;
                setupOpts = {
                    lazy = false;
                };
            };
        };
    };

    vim.formatter.conform-nvim = {
        enable = true;
        presets = {
            nixfmt.enable = true;
            shfmt.enable = true;
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
                nix = [ "nixfmt" ];
                sh = [ "shfmt" ];
            };
        };
    };

    # lsp
    vim.lsp = {
        formatOnSave = true;
        lspconfig.enable = true;
        trouble.enable = true;
    };
}
