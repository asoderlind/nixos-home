{
  # Git Configuration ( For Pulling Software Repos )

  # Set Displau Manager
  displayManager = "sddm";

  # Emable/disable bundled applications
  # doomEmacsEnable = false;

  # Hyprland Settings
  extraMonitorSettings = ''
    monitor = eDP-1,1920x1080@144,0x0,1
    monitor = HDMI-A-1,1920x1080@60,1920x0,1
  '';

  # Waybar Settings
  clock24h = true;

  # Program Options
  browser = "firefox";

  gitUsername = "asoderlind";

  # Available Options:
  # Kitty, ghostty, wezterm, aalacrity
  # Note: kitty, wezterm, alacritty have to be enabled in `variables.nix`
  # Setting it here does not enable it. Kitty is installed by default
  terminal = "kitty"; # Set Default System Terminal

  keyboardLayout = "us";
  consoleKeyMap = "us";

  # For hybrid support (Intel/NVIDIA Prime or AMD/NVIDIA)
  intelID = "PCI:0:2:0";
  # amdgpuID = "PCI:5:0:0";
  nvidiaID = "PCI:1:0:0";

  # Enable NFS
  # enableNFS = true;

  # Enable Printing Support
  # printEnable = false;

  # Enable Thunar GUI File Manager
  # Yazi is default File Manager
  thunarEnable = true;

  # Set Stylix Image
  # This will set your color palette
  # Default background
  stylixImage = ../../wallpapers/wallhaven_72kx69.jpg;

  # Set Animation style
  # Available options are:
  # animations-def.nix  (default)
  # animations-end4.nix (end-4 project very fluid)
  # animations-dynamic.nix (ml4w project)
  # animations-moving.nix (ml4w project)
  # animChoice = ../../modules/home/hyprland/animations-def.nix;
  # animChoice = ../../modules/home/hyprland/animations-end4.nix;
  # animChoice = ../../modules/home/hyprland/animations-dynamic.nix;
  # animChoice = ../../modules/home/hyprland/animations-moving.nix;

  # Set network hostId if required (needed for zfs)
  hostId = "5ab03f50";
}
