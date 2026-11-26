{
  flake.homeModules.bat = {
    programs.bat = {
      # cat tapi lebih keren
      enable = true;
      config = {
        theme = "Catppuccin Mocha";
        paging = "never";
      };
    };

  };
}
