{ host, ... }:
{
  imports = [
    ./windowrules.nix
    ./exec-once.nix
    ./env.nix
    ./binds.nix
    ./hyprland.nix
    ./pyprland.nix
    ./hypridle.nix
    ./hyprlock.nix
  ];
}
