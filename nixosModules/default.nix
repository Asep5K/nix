{
    imports = [
        ./core/boot.nix
        ./core/filesystems.nix
        ./core/nix.nix
        ./core/zram.nix

        # desktop
        ./desktop/hyprlock.nix
        ./desktop/ly.nix

        # hardware-configuration
        ./hardware/firmware.nix
        ./hardware/graphics.nix

        # networking
        ./network/iwd.nix
        ./network/systemd-resolved.nix

        # security
        ./security

        # shell
        ./shell/editor.nix
    ];
}
