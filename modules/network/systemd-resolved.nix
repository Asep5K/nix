{
    flake.nixosModules.systemd-resolved = {
        services.resolved = {
            enable = true;
            settings.Resolve = {
                DNS = [
                    "1.1.1.1#cloudflare-dns.com"
                    "9.9.9.9#dns.quad9.net"
                ];
                DNSSEC = "true";
                FallbackDNS = [
                    "1.0.0.1#one.one.one.one"
                    "8.8.8.8#dns.google"
                ];
                DNSOverTLS = "true";
                Domains = [ "~." ];
            };
        };
    };
}
