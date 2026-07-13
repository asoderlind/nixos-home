# Noctalia v5: A lightweight Wayland shell and bar (no longer QuickShell-based).
# Config lives at ~/.config/noctalia/config.toml and is managed via programs.noctalia.settings.
{
  inputs,
  ...
}:
{
  imports = [ inputs.noctalia.homeModules.default ];

  programs.noctalia = {
    enable = true;
  };
}
