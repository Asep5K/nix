{
    wayland.windowManager.niri.settings.layout = {
        gaps = 0;
        background-color = "transparent";

        center-focused-column = "on-overflow";
        preset-column-widths._children = [
            { proportion = 0.33333; }
            { proportion = 0.5; }
            { proportion = 0.66667; }
        ];
        default-column-width._children = [
            { proportion = 0.5; }
        ];
        border = {
            width = 3;
            active-color = "#f2c3d8"; # "#d9d9d9"
            inactive-color = "#262626";
            urgent-color = "#9b0000";
        };
        # sha
    };
}
