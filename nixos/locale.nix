{ config, lib, pkgs, ... }:

{
  # Timezone and Locale Settings
  time.timeZone = "Africa/Tunis";           # Set the correct timezone
  i18n.defaultLocale = "en_US.UTF-8";       # Set system locale
}

