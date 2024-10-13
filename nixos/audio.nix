{ config, lib, pkgs, ... }:

{
  # Audio System Configuration
  services.pipewire.enable = true;          # Enable PipeWire (audio system)
  services.pipewire.pulse.enable = true;    # Enable PulseAudio support within PipeWire
}

