{
    flake.nixosModules.xfce4 =
        { pkgs, ... }:
        {
            services.xserver = {
                enable = false;
                desktopManager.xfce.enable = false;
            };
            environment.xfce.excludePackages = with pkgs; [
                xfce4-weather-plugin
                xfce4-terminal
                xfce4-genmon-plugin
                xfce4-battery-plugin
                xfce4-cpugraph-plugin
                xfce4-notes-plugin
                xfce4-systemload-plugin
                xfce4-netload-plugin
                xfce4-cpufreq-plugin
                xfce4-sensors-plugin
                xfce4-eyes-plugin
                xfce4-mailwatch-plugin
                xfce4-fsguard-plugin
                xfce4-mpc-plugin
            ];
        };
}
