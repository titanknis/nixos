{ config, lib, pkgs, ... }:

{
  # Enable the firewall
  networking.firewall.enable = true;

  # Open ports in the firewall
  networking.firewall.allowedTCPPorts = [
    22    # SSH
    80    # HTTP
    443   # HTTPS
    # Add any other necessary TCP ports here
    # Example for local development:
    # 3000  # Node.js development server
    # 8080  # Common alternative HTTP port
  ];

  networking.firewall.allowedUDPPorts = [
    53    # DNS
    123   # NTP
    # Add any other necessary UDP ports here
    # Example for VoIP:
    # 5060  # SIP (for VoIP)
    # 10000-20000 # RTP (for VoIP media traffic)
  ];
}

