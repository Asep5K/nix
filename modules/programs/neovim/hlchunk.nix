{
  flake.homeModules.nvf-hlchunk = { pkgs, ... }: {
    programs.nvf.vim.extraPlugins = {
      hlchunk = pkgs.vimUtils.buildVimPlugin {
        pname = "hlchunk";
        version = "1.3.0";
        src = pkgs.fetchFromGitHub {
          owner = "shellRaining";
          repo = "hlchunk.nvim";
          rev = "4ddc056e4ca45f1c7dc6aa21935df710b263b1aa";
          hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
        };
      };
      setup = ''
          require("hlchunk").setup({
            chunk = {
              enable = true,
              chars = {
                horizontal_line = "─",
                vertical_line = "│",
                left_top = "╭",
                left_bottom = "╰",
                right_arrow = ">",
              },
            style = "#806d9c",
            line_num = {
              style = "#806d9c",
            },
          },
        })
      '';
    };
  };
}
