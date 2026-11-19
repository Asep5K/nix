{
    services.hypridle = {
        enable = true;
        # systemdTarget = "niri.service";
        settings = {
            general = {
                lock_cmd = "pidof hyprlock || hyprlock";
                before_sleep_cmd = "loginctl lock-session";
            };
            listener = [
                {
                    timeout = 600;
                    on-timeout = "brightnessctl -s set 5";
                    on-resume = "brightnessctl -r";
                }
                {
                    timeout = 660;
                    on-timeout = "loginctl lock-session";
                }
                {
                    timeout = 900;
                    on-timeout = "niri msg action power-off-monitors";
                    on-resume = "niri msg action power-on-monitors && brightnessctl -r";
                }
                {
                    timeout = 960;
                    on-timeout = "systemctl sleep";
                }
            ];
        };
    };
}
