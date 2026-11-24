{
  flake.nixosModules.networking = {
    lib,
    config,
    ...
  }: {
    users.users.iuno.extraGroups = lib.optionals config.networking.networkmanager.enable [
      "networkmanager"
    ];
    networking = {
      wireless.enable = false;
      dhcpcd.enable = false;
      #networking.enableIPv6 = false;
      networkmanager = {
        enable = true;
        dns = "systemd-resolved";
        wifi = {
          backend = "iwd";
          powersave = false;
          scanRandMacAddress = false;
        };
      };
      wireless.iwd = {
        enable = true;
        settings = {
          General.EnableNetworkConfiguration = !config.networking.networkmanager.enable;
          DriverQuirks.DefaultInterface = lib.mkForce "";
        };
      };
    };
  };
}
# vi: nowrap
