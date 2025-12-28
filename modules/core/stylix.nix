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
      base00 = "1a2420"; # background - deep forest night
      base01 = "243329"; # lighter background - forest shadow
      base02 = "2d4030"; # selection background - moss shadow
      base03 = "3d5038"; # comments - muted forest
      base04 = "5d6d5a"; # dark foreground - forest mist
      base05 = "c4d1c0"; # default foreground - pale moss
      base06 = "d8e3d4"; # light foreground - morning mist
      base07 = "e8f1e4"; # lightest foreground - bright mist
      base08 = "d08770"; # red -> autumn orange (for errors)
      base09 = "a3723a"; # orange -> earthy brown
      base0A = "d9c991"; # yellow -> golden autumn
      base0B = "5f8767"; # green -> deep forest green
      base0C = "6b9080"; # cyan -> sage green
      base0D = "7a9e7e"; # blue -> moss green
      base0E = "8b7f77"; # magenta -> bark brown
      base0F = "6d5d4b"; # brown -> dark earth
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
