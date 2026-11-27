{
  flake.nixosModules.networking =
    {
      lib,
      config,
      ...
    }:
    {
      users.users.iuno.extraGroups = lib.optionals config.networking.networkmanager.enable [
        "networkmanager"
      ];
      networking = {
        wireless.enable = false;
        dhcpcd.enable = false;
        #networking.enableIPv6 = false;
        networkmanager = {
          enable = lib.mkDefault false;
          dns = "systemd-resolved";
          wifi = {
            backend = "iwd";
            powersave = false;
            scanRandMacAddress = false;
          };
        };
        wireless.iwd = {
          enable = lib.mkDefault true;
          settings = {
            General = {
              EnableNetworkConfiguration = !config.networking.networkmanager.enable;
              AddressRandomization = "once"; # "network";
              Country = "ID";
            };
            DriverQuirks = {
              PowerSaveDisable = "brcmsmac";
              MulticastRxDisable = "brcmsmac";
              DefaultInterface = lib.mkForce "";
            };
          };
        };
      };
    };
}
# vi: nowrap
