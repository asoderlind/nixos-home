# NH is a modern helper utility that implements tools from the NixOS ecosystem
{
  pkgs,
  username,
  ...
}:
{
  programs.nh = {
    enable = true;
    clean = {
      enable = true;
      dates = "weekly"; # Run automatic cleanup weekly
      extraArgs = "--keep-since 7d --keep 5";
    };
    flake = "/home/${username}/repos/nixos-home";
  };

  environment.systemPackages = with pkgs; [
    nix-output-monitor
    nvd
  ];
}
