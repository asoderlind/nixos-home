{
  pkgs,
  host,
  ...
}:
let
  inherit (import ../../hosts/${host}/variables.nix) stylixImage;
in
{
  # Styling Options
  stylix = {
    enable = true;
    image = stylixImage;
    polarity = "dark";
    opacity.terminal = 1.0;
    override = {
      base08 = "7aa874"; # red -> green
      base09 = "8fb573"; # orange -> light green
      base0A = "a3be8c"; # yellow -> pale green
      base0B = "8fbcbb"; # green -> cyan-green
      base0C = "88c0d0"; # cyan -> light cyan
      base0D = "81a1c1"; # blue -> muted blue-green
      base0E = "b48ead"; # magenta -> keep similar
      base0F = "a3be8c"; # brown -> pale green
    };
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };
    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrains Mono";
      };
      sansSerif = {
        package = pkgs.montserrat;
        name = "Montserrat";
      };
      serif = {
        package = pkgs.montserrat;
        name = "Montserrat";
      };
      sizes = {
        applications = 12;
        terminal = 15;
        desktop = 11;
        popups = 12;
      };
    };
  };
}
