{ pkgs, ... }:
{
    hardware.cpu.intel.microcodePackage = pkgs.microcode-intel;
}
