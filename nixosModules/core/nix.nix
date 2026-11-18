{
    nix.settings = {
        http-connections = 0; # No limit

        experimental-features = [
            "nix-command"
            "flakes"
        ];
    };
}
