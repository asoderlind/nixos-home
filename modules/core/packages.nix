{
  pkgs,
  inputs,
  ...
}:
{
  programs = {
    # Neovim is configured via nvf in home-manager (modules/home/nvf.nix)
    # neovim = {
    #   enable = true;
    #   defaultEditor = true;
    # };
    firefox.enable = false; # Firefox is not installed by default
    hyprland = {
      enable = true; # set this so desktop file is created
      withUWSM = false;
    };
    dconf.enable = true;
    seahorse.enable = true;
    fuse.userAllowOther = true;
    mtr.enable = true;
    adb.enable = true;
    hyprlock.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
      gamescopeSession.enable = true;
    };
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    app2unit # launcher for noctalia-shell
    amfora # Fancy Terminal Browser For Gemini Protocol
    appimage-run # Needed For AppImage Support
    bat # rust cat
    brave # Brave Browser
    brightnessctl # For Screen Brightness Control
    claude-code # Claude code terminal AI (Optional: Client only)
    cachix
    cliphist # Clipboard manager using rofi menu
    cowsay # Great Fun Terminal Program
    difftastic # git
    #discord  # Stable client
    docker-compose # Allows Controlling Docker From A Single File
    duf # Utility For Viewing Disk Usage In Terminal
    dysk # Disk space util nice formattting
    eza # Beautiful ls Replacement
    ffmpeg # Terminal Video / Audio Editing
    file-roller # Archive Manager
    fzf # fuzzy finder
    gedit # Simple Graphical Text Editor
    gpu-screen-recorder # needed for nnoctalia-shell
    matugen # color palette generator needed for noctalia-shell
    mesa-demos # needed for inxi diag util (includes glxinfo)
    tuigreet # The Login Manager (Sometimes Referred To As Display Manager)
    htop # Simple Terminal Based System Monitor
    hyprpicker # Color Picker
    hyprshot # Screen capture
    eog # For Image Viewing
    inxi # CLI System Information Tool
    killall # For Killing All Instances Of Programs
    libnotify # For Notifications
    lm_sensors # Used For Getting Hardware Temps
    lolcat # Add Colors To Your Terminal Command Output
    lshw # Detailed Hardware Information
    mpv # Incredible Video Player
    neofetch
    ncdu # Disk Usage Analyzer With Ncurses Interface
    nixfmt-rfc-style # Nix Formatter
    nix-prefetch-git
    nix-tree
    nwg-displays # configure monitor configs via GUI
    onefetch # provides zsaneyos build info on current system
    pavucontrol # For Editing Audio Levels & Devices
    pciutils # Collection Of Tools For Inspecting PCI Devices
    picard # For Changing Music Metadata & Getting Cover Art
    pkg-config # Wrapper Script For Allowing Packages To Get Info On Others
    playerctl # Allows Changing Media Volume Through Scripts
    power-profiles-daemon # needed for noctalia-shell power cycle
    rhythmbox # audio player
    ripgrep # Improved Grep
    socat # Needed For Screenshots
    tmux # terminal multiplexer
    tree # folder structure visualizer
    unrar # Tool For Handling .rar Files
    unzip # Tool For Handling .zip Files
    usbutils # Good Tools For USB Devices
    uwsm # Universal Wayland Session Manager (optional must be enabled)
    upower # noctalia battery
    v4l-utils # Used For Things Like OBS Virtual Camera
    warp-terminal # Terminal with AI support build in
    waypaper # Change wallpaper
    wget # Tool For Fetching Files With Links
    ytmdl # Tool For Downloading Audio From YouTube
  ];
}
