{ pkgs, ... }:
{
  xdg = {
    enable = true;
    mime.enable = true;
    mimeApps = {
      enable = true;
    };
    portal = {
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
      configPackages = [ pkgs.hyprland ];
    };
  };

  # Ensure XDG_DATA_DIRS includes system applications
  home.sessionVariables = {
    XDG_DATA_DIRS = "$HOME/.nix-profile/share:$HOME/.local/share:/run/current-system/sw/share:$XDG_DATA_DIRS";
  };
}
