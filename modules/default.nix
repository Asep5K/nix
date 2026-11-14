{
  imports = [
    ./config
    ./programs
    ./services
    ./system/boot/zram-as-tmp.nix
    ./tasks/filesystems.nix
    ./hardware
    ./security/wrappers
  ];
}
