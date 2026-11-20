{
    flake.homeModules.nvf-languages = {
        programs.nvf.settings = {
            vim.languages = {
                enableTreesitter = true;
                nix = {
                    enable = true;
                    lsp.enable = true;
                    format.enable = true;
                    treesitter.enable = true;
                };
                bash = {
                    enable = true;
                    format.enable = true;
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
                python = {
                    lsp.servers = [ "ruff" ];
                    lsp.enable = true;
                    format.type = [
                        "ruff"
                        "ruff-fix"
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
                        nix = [ "nixfmt" ];
                        sh = [ "shfmt" ];
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
                lightbulb.enable = true;
                presets = {
                    ruff.enable = true;
                    bash-language-server.enable = true;
                };
            };
        };
    };
}
