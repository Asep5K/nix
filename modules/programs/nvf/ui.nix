{
  flake.homeModules.nvf-ui = {
    # NOTE: Test NOTE
    # BUG: Test BUG
    # HACK: Test HACK
    programs.nvf.settings = {
      vim = {
        notes.todo-comments.enable = true;
        statusline.lualine.enable = true;
        binds.whichKey.enable = true;
        fzf-lua.enable = true;
        telescope.enable = true;
        utility.yazi-nvim.enable = true;
        git.gitsigns.enable = true;
        utility.vim-wakatime.enable = true;
        ui.colorizer.enable = true;
      };
      vim.visuals = {
        indent-blankline.enable = true;
        nvim-web-devicons.enable = true;
        highlight-undo.enable = true;
      };

      vim.tabline.nvimBufferline = {
        enable = true;
        mappings = {
          cycleNext = "<tab>";
          cyclePrevious = "<S-tab>";
          closeCurrent = "<leader>bx";
        };
      };

      vim = {
        filetree.nvimTree = {
          enable = true;
          openOnSetup = false;
          setupOpts = {
            disable_netrw = true;
            filters.dotfiles = true;
            view = {
              width = 30;
              preserve_window_proportions = true;
            };
            renderer = {
              root_folder_label = false;
              highlight_git = true;
              indent_markers = {enable = true;};
            };
          };
        };
        # NOTE: ini keymap buat nvimTree!
        keymaps = [
          {
            key = "<C-n>";
            mode = "n";
            action = "<cmd>NvimTreeToggle<CR>";
            desc = "nvimTree toggle window";
          }
          {
            key = "<leader>e";
            mode = "n";
            action = "<cmd>NvimTreeFocus<CR>";
            desc = "nvimtree focus window";
          }
        ];
      };
    };
  };
}
