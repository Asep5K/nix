# TODO: todo todo ....
{
    vim.keymaps = [
        # {
        #     key = ";";
        #     mode = [ "n" ];
        #     action = ":";
        #     desc = "CMD enter command mode";
        # }
        {
            key = "jk";
            mode = [ "i" ];
            action = "<ESC>";
        }
        {
            mode = "i";
            key = "<C-h>";
            action = "<Left>";
            desc = "move left";
        }
        {
            mode = "i";
            key = "<C-j>";
            action = "<Down>";
            desc = "move down";
        }
        {
            mode = "i";
            key = "<C-k>";
            action = "<Up>";
            desc = "move up";
        }
        {
            mode = "i";
            key = "<C-l>";
            action = "<Right>";
            desc = "move down";
        }
        {
            mode = "i";
            key = "<C-e>";
            action = "<ESC>^i";
            desc = "move beginning of line";
        }
        {
            mode = "i";
            key = "<C-b>";
            action = "<END>";
            desc = "move end of line";
        }
        {
            mode = "n";
            key = "<C-s>";
            action = "<cmd>w<CR>";
            desc = "general save file";
        }
    ];
}
