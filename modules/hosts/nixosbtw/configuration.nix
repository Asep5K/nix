{
  flake.nixosModules.configuration =
    {
      pkgs,
      ...
    }:
    {

      networking.hostName = "nixosbtw"; # Define your hostname.

      time.timeZone = "Asia/Jakarta";

      users.users.iuno = {
        isNormalUser = true;
        extraGroups = [
          "wheel"
          "video"
          "render"
          "pipewire"
          "audio"
        ]; # Enable ‘sudo’ for the user.
        shell = pkgs.zsh;
      };

      programs.niri = {
        enable = true;
        useNautilus = false;
      };
      environment.systemPackages = with pkgs; [
        wget
        git # lol
      ];

      system.stateVersion = "26.05"; # Did you read the comment?
    };
}
