{
  flake.homeModules.mako = {
    services.mako = {
      enable = true;
      settings = {
        anchor = "top-right";
        sort = "-time";
        layer = "overlay";
        max-visible = 3;
        width = 400;
        height = 110;
        margin = 15;
        padding = "0,10,25";
        actions = 1;
        # timeout
        ignore-timeout = 1;
        default-timeout = 3000;

        # icons
        icons = 1;
        icon-border-radius = 10;
        max-icon-size = 100;

        # border
        border-size = 3;
        border-radius = 20;

        # text & font
        font = "JetBrainsMono NF 13";
        text-alignment = "center";
      };
      extraConfig = ''
        border-color=#cba6f7
        text-color=#cdd6f4
        background-color=#1e1e2e

        [app-name=wp-vol]
        layer=overlay
        history=0
        anchor=top-right
        # Group all volume notifications together
        group-by=app-name
        # Hide the group-index
        format=<b>%s</b>\n%b

        [app-name=volume group-index=0]
        # Only show last notification
        invisible=0
        [mode=do-not-disturb]
        invisible=true
        ignore-timeout=true
      '';
    };
  };
}
