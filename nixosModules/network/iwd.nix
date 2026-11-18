{
  networking.wireless.enable = false;
  networking.dhcpcd.enable = false;
  networking.enableIPv6 = false;
  networking.wireless.iwd = {
    enable = true;
    settings = {
      General.EnableNetworkConfiguration = true;
    };
  };
}
