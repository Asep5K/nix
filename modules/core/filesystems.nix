{
    flake.nixosModules.fileSystems = {
        fileSystems."/".options = [ "noatime" ];
        fileSystems."/media/hdd" = {
            device = "/dev/disk/by-uuid/ca6e76f2-4b3a-4676-b7aa-5d791e37b0dc";
            fsType = "ext4";
            options = [
                "noauto"
                "noatime"
                "noexec"
                "user"
                "rw"
                "nofail"
                "x-mount.mkdir"
                "x-systemd.automount"
                "x-systemd.idle-timeout=60"
            ];
        };
    };
}
