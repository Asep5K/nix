{
  flake.nixosModules.btop = {pkgs, ...}: {
    security.wrappers.btop = {
      source = "${pkgs.btop}/bin/btop";
      capabilities = "cap_perfmon+ep";
      owner = "root";
      group = "root";
    };
  };
  flake.homeModules.btop = {
    programs.btop.enable = true;
  };
}
