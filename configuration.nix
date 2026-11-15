{
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ./modules
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  boot.loader.grub = {
    enable = true;
    device = "/dev/sda";
  };

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

  programs = {
    niri.enable = true;
    neovim.enable = true;
  };
  environment.systemPackages = with pkgs; [
    wget
    git # lol
    btop # system monitor
  ];

  system.stateVersion = "26.05"; # Did you read the comment?

}
