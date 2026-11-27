{
  flake.homeModules.cava = { config, lib, ... }: {
    programs.cava = {
      enable = true;
      settings = {
        general = {
          framerate = 60;
          center_align = 1;
        };
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
            background = "'${c.base}'";
            foreground = "'${c.blue}'";
            gradient = 0;
          };
        smoothing.monstercat = 1;
      };
    };
  };
}
