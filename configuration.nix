{
    pkgs,
    ...
}:

{
    imports = [
        ./hardware-configuration.nix
        ./modules
    ];

    boot.loader.grub = {
        enable = true;
        device = "/dev/sda";
    };

    networking.hostName = "nixosbtw"; # Define your hostname.

    time.timeZone = "Asia/Jakarta";
    programs.fish.enable = true;
    environment.variables.SUDO_PROMPT = "Passwd!: ";
    users.users.iuno = {
        isNormalUser = true;
        extraGroups = [
            "wheel"
            "video"
            "render"
            "pipewire"
            "audio"
        ]; # Enable ‘sudo’ for the user.
        shell = pkgs.fish;
    };

    programs.niri.enable = true;
    environment.systemPackages = with pkgs; [
        wget
        git # lol
        wireless-regdb
    ];

    system.stateVersion = "26.05"; # Did you read the comment?

}
