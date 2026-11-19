{ pkgs, ... }:

#  https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git

# rubah config disuruh doanload firmware 800 mb sopo sing ra kesuh asu,, mending ambil pretelan nya wae kontol.
let
    rev = "747bdda274d0d0dce0c7c4eb01977a1270ca716";
    baseUrl = "https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/plain";

    fetchFw =
        path: hash:
        pkgs.fetchurl {
            url = "${baseUrl}/${path}?id=${rev}";
            inherit hash;
        };
    rtl8411_1 = fetchFw "rtl_nic/rtl8411-1.fw" "sha256-5moxg3h8gJh+HjbJ99Syw81dl2ZAuD9GJwL5FP68Szg=";
    rtl8411_2 = fetchFw "rtl_nic/rtl8411-2.fw" "sha256-gNvay6TV3+5GtsK05DP28u63VtKa1GvyNiuiDI7FlLE=";
    bcm43xx = fetchFw "brcm/bcm43xx-0.fw" "sha256-JGaMcC5yPSscrr2gR+6XXOFtft8jeIvER9wSvK8kaw8=3vb4jpvq4nw8z28ny13vxz6vqawjzp4g85xmqf2ngbj5rq8qri4";
    bcm43xxHdr = fetchFw "brcm/bcm43xx_hdr-0.fw" "sha256-SqorpimD1ktl81GQjFkGKop8mRANGQkEwOeA18MPDdA=";
in
{
    hardware = {
        cpu.intel.microcodePackage = true;
        enableRedistributableFirmware = false;
        firmwareCompression = "none"; # "zstd";
        wirelessRegulatoryDatabase = true;
        firmware = [
            (pkgs.runCommand "firmware-minimal" { } ''
                mkdir -p $out/lib/firmware/{brcm,rtl_nic}
                cp ${rtl8411_1}  $out/lib/firmware/rtl_nic/rtl8411-1.fw
                cp ${rtl8411_2}  $out/lib/firmware/rtl_nic/rtl8411-2.fw
                cp ${bcm43xx}    $out/lib/firmware/brcm/bcm43xx-0.fw
                cp ${bcm43xxHdr} $out/lib/firmware/brcm/bcm43xx_hdr-0.fw
            '')
        ];
    };
}

# vi: nowrap
