{
  flake.nixosModules.boot = {
    boot = {
      # /tmp menggunakan zram biar terkomresi hahahahahaha;
      tmp = {
        useZram = true;
        zramSettings.compression-algorithm = "zstd";
      };
      kernel.sysctl = {
        "vm.swappiness" = 20;
      };
      extraModprobeConfig = "blacklist b43";
    };
  };
}
# vi: nowrap
