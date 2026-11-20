{
    flake.nixosModules.ly = {
        services.displayManager.ly = {
            enable = true;
            settings = {
                allow_empty_password = false;
                animation = "matrix";
                #dur_file_path = "/etc/ly/blackhole.dur";
                vi_mode = true;
                full_color = true;
                bigclock = true;
                bigclock_12_hr = true;
            };
        };
    };
}
