{
  flake.nixosModules.acer-aspire-e1-471 = {pkgs, ...}: {
    boot = {
      initrd.kernelModules = ["i915"];
    };
    hardware.graphics = {
      enable = true;
      extraPackages = with pkgs; [intel-vaapi-driver];
    };
    environment.sessionVariables.LIBVA_DRIVER_NAME = "i965";
  };
}
