{ host, config, pkgs, ... }:
{
  # Import modules
  imports = [
    ./firefox
    ./git.nix
    ./htop.nix
    ./hyprland
    ./kitty.nix
    ./tmux.nix
    ./vim.nix
    ./vscode.nix
    ./waybar/waybar-simple.nix
    ./xdg.nix
    ./zsh.nix
  ];
}
