{
  flake.homeModules.nvf-hlchunk =
    { pkgs, config, ... }:
    let
      c = config.theme.palette;
    in
    {
      programs.nvf.settings.vim.extraPlugins = {
        hlchunk = {
          package = pkgs.vimUtils.buildVimPlugin {
            pname = "hlchunk";
            version = "1.3.0";
            src = pkgs.fetchFromGitHub {
              owner = "shellRaining";
              repo = "hlchunk.nvim";
              rev = "4ddc056e4ca45f1c7dc6aa21935df710b263b1aa";
              hash = "sha256-1ltHngFFCpbsU+k4osyjl4FKXn0AX7bLz+pCG9My+ac=";
            };
          };
          setup = ''
            require("hlchunk").setup({
              chunk = {
                enable = true,
                straight = false,
                delay = 400,
                chars = {
                  horizontal_line = "─",
                  vertical_line = "│",
                  left_top = "╭",
                  left_bottom = "╰",
                  right_arrow = ">",
                },
                style = {
                  { fg = "${c.mauve}" },
                  { fg = "${c.red}" },
                },
              },
              line_num = {
                enable = true,
                style = "${c.pink}",
              },
              indent = {
                enable = true,
                style = "${c.surface2}",
              },
            })
          '';
        };
      };
    };
}
