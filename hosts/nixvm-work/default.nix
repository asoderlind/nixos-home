{ config, pkgs, ... }:
{
  home.username = "axel-soderlind";
  home.homeDirectory = "/home/axel-soderlind";

  # Import modules specific to this machine
  imports = [
    (import ../../modules/git.nix { inherit pkgs; userEmail = "axel.soderlind@rollingoptics.com"; })
  ];
}
