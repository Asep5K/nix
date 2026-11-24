{
  flake.nixosModules.security-doas = {
    pkgs,
    config,
    lib,
    ...
  }: let
    hasDoas = config.security.doas.enable;
  in {
    security = {
      sudo.enable = !hasDoas;
      doas = {
        enable = lib.mkDefault true;
        extraRules = [
          {
            users = ["iuno"];
            keepEnv = true;
            persist = true;
          }
        ];
      };
    };
    environment.systemPackages = lib.mkIf hasDoas [
      (pkgs.writeShellScriptBin "sudo" ''
        exec /run/wrappers/bin/doas "$@"
      '')
    ];
  };
}
