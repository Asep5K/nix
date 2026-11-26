{
  flake.homeModules.nvf-nix = {
    programs.nvf.settings.vim = {
      languages.nix = {
        enable = true;
        format.enable = true;
        treesitter.enable = true;
        format.type = [ "nixfmt" ];
        lsp.servers = [ "nixd" ];
      };

    formatter.conform-nvim = {
      enable = true;
      presets.nixfmt.enable = true;
       setupOpts.formatters_by_ft.nix = [ "nixfmt" ];
    };

    lsp = {
      enable = true;
      presets.nixd.enable = true;
    };
  };
};
}

