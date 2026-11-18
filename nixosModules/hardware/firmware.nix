{ pkgs, ... }:
{
    hardware = {
        cpu.intel.microcodePackage = true;
        enableRedistributableFirmware = false;
        firmwareCompression = "zstd";
        wirelessRegulatoryDatabase = true;
        firmware = [
            (pkgs.runCommand "firmware-minimal" { } ''
                mkdir -p $out/lib/firmware
                cp -rL ${pkgs.linux-firmware}/lib/firmware/brcm    $out/lib/firmware/
                cp -rL ${pkgs.linux-firmware}/lib/firmware/rtl_nic $out/lib/firmware/
            '')
        ];
    };
}
