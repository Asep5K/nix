{
    vim.autocomplete.blink-cmp = {
        enable = true;
        friendly-snippets.enable = true;
        sourcePlugins = {
            ripgrep.enable = true;
            spell.enable = true;
        };
    };

    vim.autopairs.nvim-autopairs.enable = true;

    vim = {
        comments = {
            comment-nvim = {
                enable = true;
                setupOpts.mappings.basic = true;
            };
        };
        keymaps = [
            {
                key = "<leader>/";
                mode = "n";
                action = "gcc";
                desc = "Toggle comment (line)";
                noremap = false;
            }
            {
                key = "<leader>/";
                mode = "v";
                action = "gc";
                noremap = false;
                desc = "Toggle comment (selection)";
            }
        ];
    };
}
