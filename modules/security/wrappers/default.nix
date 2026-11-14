{ pkgs, ... }:
{
  security.wrappers = {
    btop = {
      source = "${pkgs.btop}/bin/btop";
      capabilities = "cap_perfmon+ep";
      owner = "root";
      group = "root";
    };
  };
}
