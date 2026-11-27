{
  flake.homeModules.cava = { config, ... }: {
    programs.cava = {
      enable = true;
      settings = {
        general.framerate = 60;
        input = {
          method = "pipewire";
          source = "auto";
        };
        output = {
          method = "ncurses";
          channels = "stereo";
        };
        color =
          let
            c = config.theme.palette;
          in
          {
            background = "${c.base}";
            foreground = "${c.mauve}";
            gradient = 0;
          };
      };
    };
  };
}
