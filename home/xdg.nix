{ config, ... }:
{
    xdg = {
        enable = true;
        localBinInPath = true;

        mimeApps = {
            enable = true;
            # associations.added = {}; # Optional!
            #  associations.removed
            defaultApplications = {
                "video/*" = "mpv.desktop";
                "image/*" = "swayimg.desktop";
                "text/*" = "nvim.desktop";
            };
        };
        userDirs = {
            enable = true;
            # setSessionVariables = true; # The recommended way to get these values is via the xdg-user-dir command or by processing $XDG_CONFIG_HOME/user-dirs.dirs directly in your application.
            videos = "${config.home.homeDirectory}/Documents/Videos";
            music = "${config.home.homeDirectory}/Documents/Music";
            pictures = "${config.home.homeDirectory}/Documents/Pictures";
        };
    };
}
# vi: nowrap
