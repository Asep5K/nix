#  https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
# rubah config disuruh doanload firmware 800 mb sopo sing ra kesuh asu,, mending ambil pretelan nya wae kontol.
{
  flake.nixosModules.hardware-firmware = {
    pkgs,
    lib,
    ...
  }: {
    hardware = {
      cpu.intel.updateMicrocode = true;
      enableRedistributableFirmware = false;
      firmwareCompression = "none"; # "zstd";
      wirelessRegulatoryDatabase = true;
      firmware = let
        rev = "a1ebb5ad7eae3caca60b8b3db5792cf43339ba58";
        baseUrl = "https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/plain";

        files = {
          "rtl_nic/rtl8411-1.fw" = "sha256-5moxg3h8gJh+HjbJ99Syw81dl2ZAuD9GJwL5FP68Szg=";
          "brcm/bcm43xx-0.fw" = "sha256-JGaMcC5yPSscrr2gR+6XXOFtft8jeIvER9wSvK8kaw8=";
          "brcm/bcm43xx_hdr-0.fw" = "sha256-SqorpimD1ktl81GQjFkGKop8mRANGQkEwOeA18MPDdA=";
        };

        fetchFw = path: hash:
          pkgs.fetchurl {
            name = baseNameOf path;
            url = "${baseUrl}/${path}?id=${rev}";
            inherit hash;
          };
      in [
        (pkgs.runCommand "firmware-minimal" {}
          (lib.concatStrings
            (lib.mapAttrsToList (path: hash: ''
                install -Dm444 ${fetchFw path hash} $out/lib/firmware/${path}
              '')
              files)))
      ];
    };
  };
}
# vi: nowrap
