{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    # Nix
    nix-prefetch-git
    nix-tree
    cachix

    # Tools
    ripgrep
    fzf
    tmux
    neofetch
    bat

    # Git
    difftastic

    # Fonts
    jetbrains-mono

    # Networking
    nmap

    # Misc
    cowsay
    tree
    which
  ];

  # Import modules
  imports = [
    ./git.nix
    ./tmux.nix
    ./shell/zsh.nix
    ./editor/vim.nix
    ./terminal/kitty.nix
    ./waybar/waybar-simple.nix
    ./browser/firefox.nix
    ./wm
  ];

  home.stateVersion = "25.05"; # Please read the comment before changing.
  programs.home-manager.enable = true;
  news.display = "silent";

  fonts.fontconfig.enable = true;

}
