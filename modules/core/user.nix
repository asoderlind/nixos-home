{
  pkgs,
  inputs,
  host,
  username,
  profile,
  ...
}:
let
  inherit (import ../../hosts/${host}/variables.nix) gitUsername;
in
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = false;
    backupFileExtension = "backup";
    extraSpecialArgs = {
      inherit
        inputs
        username
        host
        profile
        ;
    };
    users.${username} = {
      imports = [ ./../home ];
      home = {
        username = "${username}";
        homeDirectory = "/home/${username}";
        stateVersion = "25.05";
      };
    };
  };
  users.mutableUsers = true;
  users.users.${username} = {
    isNormalUser = true;
    description = "${gitUsername}";
    extraGroups = [
      "adbusers"
      "docker" # access to docker as non-root
      "libvirtd" # Virt manager/QEMU access
      "lp"
      "networkmanager"
      "scanner"
      "wheel" # subdo access
      "vboxusers" # Virtual Box
    ];
    shell = pkgs.zsh;
  };

  # Required whenever a user's shell is zsh: this generates /etc/zshenv etc.,
  # which source /etc/set-environment. Without it, login zsh never exports
  # XDG_DATA_DIRS, so uwsm cannot find wayland-sessions/hyprland.desktop and
  # the uwsm session dies at login with a black screen.
  programs.zsh.enable = true;

  nix.settings.allowed-users = [ "${username}" ];
}
