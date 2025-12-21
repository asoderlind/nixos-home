# GTK
{
  config,
  lib,
  pkgs,
  ...
}:
{
  # GTK configuration for tray icons
  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
  };
}
