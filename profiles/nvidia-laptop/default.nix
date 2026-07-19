{ host, ... }:
let
  inherit (import ../../hosts/${host}/variables.nix) intelID nvidiaID;
in
{
  imports = [
    ../../hosts/${host}
    ../../modules/drivers
    ../../modules/core
  ];
  # Enable GPU Drivers
  drivers.nvidia.enable = true;

  hardware.nvidia.prime = {
    sync.enable = true;
    intelBusId = intelID;
    nvidiaBusId = nvidiaID;
  };
}
