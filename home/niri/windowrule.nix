{
    # Stup..
    wayland.windowManager.niri.extraConfig = ''
        window-rule {
            //match is-active=false
            opacity 0.95
           background-effect{
               blur true
               xray false
            }
        }
        window-rule {
            match app-id="librewolf"
            opacity 1.0
        }

        window-rule{
            match app-id="btop" title="btop"
            open-floating true
            default-window-height { proportion 0.9; }
            default-column-width { proportion 0.8; }
         //      opacity 0.9
           background-effect{
                blur true
                xray false
            }
        }
        window-rule{
            match app-id="^mpv$"
            open-floating true
            default-column-width { proportion 0.8; }
            default-window-height { proportion 0.9;}
            variable-refresh-rate true
        }

        window-rule{
            match app-id="btop" title="btop"
            open-floating true
            default-window-height { proportion 0.9; }
            default-column-width { proportion 0.8; }
        }
        window-rule{
            match app-id="xdg-desktop-portal-gtk"
            open-floating true
        }

        window-rule {
            match app-id="Bitwarden"
            block-out-from "screen-capture"
        }

        layer-rule{
            match namespace=r#"^(awww-daemon|wallpaper|mpvpaper)$"#
            place-within-backdrop true
        }

        layer-rule{
            match namespace="rofi"
            opacity 0.7
            background-effect{
                blur true
                xray false
                }
           }
        blur {
            passes 2
            offset 2.0
            noise 0.015
            saturation 1.2
        }
    '';
}
