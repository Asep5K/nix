{
  flake.homeModules.dev = {
    pkgs,
    config,
    ...
  }: {
    home.packages = with pkgs; [
      gnumake # make
      rustc # rust compiler

      python3 # ular piton
    ];
    programs = {
      cargo = {
        enable = true;
        cargoHome = "${config.xdg.dataHome}/cargo";
      };
      gcc = {
        enable = true;
        colors = {
          error = "01;38;2;243;139;168"; # Red
          warning = "01;38;2;249;226;175"; # Yellow
          note = "01;38;2;137;220;235"; # Sky
          path = "01;38;2;137;220;235"; # Sky
          range1 = "38;2;166;227;161"; # Green
          range2 = "38;2;137;180;250"; # Blue
          locus = "01;38;2;205;214;244"; # Text
          quote = "01;38;2;250;179;135"; # Peach
          fixit-insert = "38;2;166;227;161"; # Green
          fixit-delete = "38;2;243;139;168"; # Red
          diff-filename = "01;38;2;205;214;244";
          diff-hunk = "38;2;148;226;213"; # Teal
          diff-delete = "38;2;243;139;168";
          diff-insert = "38;2;166;227;161";
          type-diff = "01;38;2;166;227;161";
        };
      };
    };
  };
}
