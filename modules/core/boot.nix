{
    flake.nixosModules.boot = {
        boot = {
            initrd.kernelModules = [ "i915" ]; # Kosmetik doang
            extraModprobeConfig = "blacklist b43"; # b43 ga kepake disini; jadi blacklist aja biar log dmesg bersih!!;

            # /tmp menggunakan zram biar terkomresi hahahahahaha;
            tmp = {
                useZram = true;
                zramSettings.compression-algorithm = "zstd";
            };
            kernel.sysctl = {
                "vm.swappiness" = 20;
            };

        };
    };
}
# vi: nowrap
