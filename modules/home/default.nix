{
  host,
  config,
  pkgs,
  ...
}:
{
  # Import modules
  imports = [
    ./firefox
    ./fzf.nix
    ./git.nix
    ./htop.nix
    ./hyprland
    ./kitty.nix
    # ./nvf.nix
    ./rofi
    ./scripts
    ./stylix.nix
    ./tmux.nix
    ./vscode.nix
    ./waybar/waybar-simple.nix
    ./wlogout
    ./xdg.nix
    ./zsh.nix
  ];
}
