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
    ./gtk.nix
    ./htop.nix
    ./hyprland
    ./kitty.nix
    ./noctalia.nix
    ./nvf.nix
    ./overview.nix
    ./scripts
    ./stylix.nix
    ./tmux.nix
    ./vscode.nix
    ./wlogout
    ./xdg.nix
    ./zsh.nix
  ];
}
