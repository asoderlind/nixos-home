# Noctalia: A beautiful, minimal desktop shell for Wayland that actually
# gets out of your way. Built on Quickshell with a warm lavender aesthetic
# that you can easily customize to match your vibe.
{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:
let
  noctaliaPath = inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default;
  configDir = "${noctaliaPath}/share/noctalia-shell";
in
{
  # Import the noctalia home manager module
  imports = [ inputs.noctalia.homeModules.default ];

  # Configure noctalia-shell with colors from stylix
  programs.noctalia-shell = {
    enable = true;
    colors = with config.lib.stylix.colors; {
      # Material Design 3 color mappings using stylix base16 colors
      mError = lib.mkForce "#${base08}"; # red/error color
      mOnError = lib.mkForce "#${base00}"; # text on error (dark background)
      mOnPrimary = lib.mkForce "#${base00}"; # text on primary (dark background)
      mOnSecondary = lib.mkForce "#${base00}"; # text on secondary (dark background)
      mOnSurface = lib.mkForce "#${base05}"; # text on surface (light foreground)
      mOnSurfaceVariant = lib.mkForce "#${base04}"; # muted text on surface
      mOnTertiary = lib.mkForce "#${base00}"; # text on tertiary (dark background)
      mOnHover = lib.mkForce "#${base07}"; # text on hover (bright)
      mOutline = lib.mkForce "#${base03}"; # outline/border color
      mPrimary = lib.mkForce "#${base0D}"; # primary accent (blue-green)
      mSecondary = lib.mkForce "#${base0C}"; # secondary accent (cyan)
      mShadow = lib.mkForce "#${base00}"; # shadow (black/darkest)
      mSurface = lib.mkForce "#${base00}"; # main surface (dark background)
      mHover = lib.mkForce "#${base01}"; # hover state (slightly lighter than surface)
      mSurfaceVariant = lib.mkForce "#${base01}"; # variant surface (slightly lighter)
      mTertiary = lib.mkForce "#${base0B}"; # tertiary accent (green)
    };
  };

  # Seed the Noctalia QuickShell shell code into ~/.config/quickshell/noctalia-shell
  # once, then leave it writable so the GUI and the user can tweak it.
  home.activation.seedNoctaliaShellCode = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    set -eu
    DEST="$HOME/.config/quickshell/noctalia-shell"
    SRC="${configDir}"

    if [ ! -d "$DEST" ]; then
      mkdir -p "$HOME/.config/quickshell"
      cp -R "$SRC" "$DEST"
      chmod -R u+rwX "$DEST"
    fi
  '';
}
