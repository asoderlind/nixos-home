{
  inputs,
  host,
  ...
}:
{
  imports = [
    ./boot.nix
    ./greetd.nix
    ./hardware.nix
    ./network.nix
    ./packages.nix
    ./sddm.nix
    ./services.nix
    ./system.nix
    ./stylix.nix
    ./thunar.nix
    ./user.nix
    # ./quickshell.nix -- not implemented yet
    ./virtualisation.nix
    ./xserver.nix
     inputs.stylix.nixosModules.stylix
  ];
}
