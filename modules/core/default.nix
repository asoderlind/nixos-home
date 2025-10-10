{
  inputs,
  host,
  ...
}:
{
  imports = [
    ./configuration.nix
    ./hardware-configuration.nix
    ./packages.nix
    ./user.nix
    ./greetd.nix
    #./stylix.nix
    # inputs.stylix.nixosModules.stylix
  ];
}
