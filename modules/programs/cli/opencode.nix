{
    flake.homeModules.opencode = { pkgs-unstable, ... }: {
        programs.opencode = {
            enable = true;
            package = pkgs-unstable.opencode;
        };
    };
}
