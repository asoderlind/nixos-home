{ host, ... }:
let
  inherit (import ../../../hosts/${host}/variables.nix)
    stylixImage
    ;
in
{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "wl-paste --type text --watch cliphist store" # Saves text
      "wl-paste --type image --watch cliphist store" # Saves images
      "dbus-update-activation-environment --all --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
"
      "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      "systemctl --user start hyprpolkitagent"
      "pypr &"
      "qs -c overview" # Start quickshell-overview daemon
      "killall -q waybar"
      "pkill waybar"
      "killall -q swaync"
      "pkill swaync"
      "noctalia-shell"

    ];
  };
}
