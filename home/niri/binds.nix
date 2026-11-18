{
    wayland.windowManager.niri.settings.binds = {
        "Mod+Return" = {
            _props.hotkey-overlay-title = "Open a Terminal";
            _props.repeat = false;
            spawn = [ "foot" ];
        };
        "Mod+E" = {
            _props.hotkey-overlay-title = "yazi";
            _props.repeat = false;
            spawn = [
                "foot"
                "yazi"
            ];
        };
        "Mod+R" = {
            spawn = [
                "rofi"
                "-show"
                "drun"
            ];
        };
        "Ctrl+Shift+Escape" = {
            _props.repeat = false;
            spawn = [
                "foot"
                "--font=JetBrainsMono Nerd Font:size=12"
                "--title=btop"
                "--app-id=btop"
                "btop"
            ];
        };
        "Mod+W".toggle-window-floating = { };
        "Ctrl+Alt+Delete".quit = { };

        # NOTE: KOTNOL
        "Mod+H".focus-column-left = { };
        "Mod+J".focus-window-down = { };
        "Mod+K".focus-window-up = { };
        "Mod+L".focus-column-right = { };

        # NOTE: ini buat switch app ke kanan atau kiri
        "Mod+Ctrl+H".move-column-left = { };
        "Mod+Ctrl+J".move-window-down = { };
        "Mod+Ctrl+K".move-window-up = { };
        "Mod+Ctrl+L".move-column-right = { };

        # NOTE: ini buat pindah workspace atas/bawah
        "Mod+U".focus-workspace-down = { };
        "Mod+I".focus-workspace-up = { };
        "Mod+Ctrl+U".move-column-to-workspace-down = { };
        "Mod+Ctrl+I".move-column-to-workspace-up = { };

        # dokumentasinya ga jelas kontol
        "Mod+O" = {
            _props.repeat = false;
            toggle-overview = { };
        };
        # close app
        "Mod+C" = {
            _props.repeat = false;
            close-window = { };
        };
        # F
        "Mod+Shift+H".consume-or-expel-window-left = { };
        "Mod+Shift+L".consume-or-expel-window-right = { };
        "F11".fullscreen-window = { };
        "Mod+F".maximize-column = { };
        "Mod+Shift+Slash".show-hotkey-overlay = { };

        # Audiokontol
        "XF86AudioPlay" = {
            _props.allow-when-locked = true;
            spawn = [
                "playerctl"
                "play-pause"
            ];
        };
        "XF86AudioStop" = {
            _props.allow-when-locked = true;
            spawn = [
                "playerctl"
                "stop"
            ];
        };
        "XF86AudioPrev" = {
            _props.allow-when-locked = true;
            spawn = [
                "playerctl"
                "previous"
            ];
        };
        "XF86AudioNext" = {
            _props.allow-when-locked = true;
            spawn = [
                "playerctl"
                "next"
            ];
        };
        # Brightness up/down
        "XF86MonBrightnessUp" = {
            _props.allow-when-locked = true;
            spawn = [
                "brightnessctl"
                "--class=backlight"
                "set"
                "+10%"
            ];
        };

        "XF86MonBrightnessDown" = {
            _props.allow-when-locked = true;
            spawn = [
                "brightnessctl"
                "--class=backlight"
                "set"
                "10%-"
            ];
        };
        # Aurdiopeler
        "XF86AudioRaiseVolume" = {
            _props.allow-when-locked = true;
            spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ -l 1.0; ~/.config/niri/scripts/wp-vol.sh";
        };
        "XF86AudioLowerVolume" = {
            _props.allow-when-locked = true;
            spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- -l 1.0; ~/.config/niri/scripts/wp-vol.sh";
        };
        "XF86AudioMute" = {
            _props.allow-when-locked = true;
            spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        };
        "XF86AudioMicMute" = {
            _props.allow-when-locked = true;
            spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        };
    };
}
# vi:nowrap
