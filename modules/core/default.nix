{
  inputs,
  host,
  ...
}:
let
  vars = import ../../hosts/${host}/variables.nix;
in
{
  imports = [
    ./boot.nix
    ./fonts.nix
    ./hardware.nix
    ./network.nix
    ./packages.nix
    (if vars.displayManager == "tui" then ./greetd.nix else ./sddm.nix)
    ./services.nix
    ./system.nix
    ./stylix.nix
    ./thunar.nix
    ./user.nix
    ./virtualisation.nix
    ./xserver.nix
    inputs.stylix.nixosModules.stylix
  ];
}
