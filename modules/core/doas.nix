{ inputs, ... }: {
  flake.nixosModules.security-doas =
    {
      pkgs,
      config,
      lib,
      ...
    }:
    let
      hasDoas = config.security.doas.enable;
    in
    {
      security = {
        sudo.enable = !hasDoas;
        doas = {
          enable = lib.mkDefault true;
          extraRules = [
            {
              users = [ "iuno" ];
              keepEnv = true;
              persist = true;
            }
          ];
        };
      };
      environment.systemPackages = lib.mkIf hasDoas [
        (pkgs.runCommand "doas-as-sudo" { } ''
          mkdir -p $out/bin
          ln -s /run/wrappers/bin/doas $out/bin/sudo
        '')
        inputs.doasedit.packages.${pkgs.stdenv.hostPlatform.system}.default
      ];
    };
}
