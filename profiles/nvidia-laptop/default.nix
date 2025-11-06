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
  # Step 1: Basic NVIDIA support
  drivers.nvidia.enable = true;
}
