{ host, config, pkgs, ... }:
{
  # Import modules
  imports = [
    ./git.nix
    ./tmux.nix
    ./shell/zsh.nix
    ./editor/vim.nix
    ./terminal/kitty.nix
    ./waybar/waybar-simple.nix
    ./browser/firefox.nix
    ./hyprland
  ];
}
