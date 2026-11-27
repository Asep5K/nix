{
  flake.nixosModules.grub = { pkgs, ... }: {
    boot.loader.grub = {
      enable = true;
      device = "/dev/sda";
      gfxmodeBios = "1366x768";
      theme = pkgs.catppuccin-grub; # default mocha!!
    };
  };
}
