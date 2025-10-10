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
    ./services.nix
    #./stylix.nix
    # inputs.stylix.nixosModules.stylix
  ];
}
