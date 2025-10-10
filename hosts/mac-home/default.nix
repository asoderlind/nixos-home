{ config, pkgs, ... }:
{
  home.username = "axel";
  home.homeDirectory = "/Users/axel";

  # Import modules specific to this machine
  imports = [
    ../../modules/yabai.nix
    ../../modules/skhd.nix
    ../../modules/terminal/ghostty.nix
    (import ../../modules/git.nix { inherit pkgs; userEmail = "axesode@gmail.com"; })
  ];
}
