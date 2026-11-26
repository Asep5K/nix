{
  flake.homeModules.fzf-lua = {
    programs.nvf.settings.vim = {
      fzf-lua = {
        enable = true;
        setupOpts = {
          winopts = {
            height = 0.85;
            width = 0.8;
            preview.default = "bat";
          };
          files = {
            formatter = "path.filename_first";
            hidden = true;
          };
          defaults.file_icons = true;
        };
      };
      keymaps = [
        {
          mode = "n";
          key = "<C-p>";
          action = "<cmd>FzfLua files<CR>";
          desc = "Cari file";
        }
        {
          mode = "n";
          key = "<leader>fg";
          action = "<cmd>FzfLua live_grep<CR>";
          desc = "Grep teks";
        }
        {
          mode = "n";
          key = "<leader>fb";
          action = "<cmd>FzfLua buffers<CR>";
          desc = "Buffer";
        }
      ];
    };
  };
}
