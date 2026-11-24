{
  flake.homeModules.jq = {
    programs.jq = {
      enable = true;
      colors = {
        null = "0;38;2;127;132;156"; # Overlay1
        false = "0;38;2;243;139;168"; # Red
        true = "0;38;2;148;226;213"; # Teal
        numbers = "0;38;2;250;179;135"; # Peach
        strings = "0;38;2;166;227;161"; # Green
        arrays = "1;38;2;205;214;244"; # Text
        objects = "1;38;2;205;214;244";
        objectKeys = "1;38;2;137;180;250"; # Blue
      };
    };
  };
}
