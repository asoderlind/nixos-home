{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    shortcut = "C-a"; # Prefix
    baseIndex = 1; # Window numbers begin with 1
    keyMode = "vi";
    customPaneNavigationAndResize = true;
    aggressiveResize = true;
    historyLimit = 100000;
    resizeAmount = 5;
    escapeTime = 10;
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "screen-256color";

    extraConfig = ''
      # Prefix
      unbind C-b
      set -g prefix C-a
      bind C-a send-prefix

      # New windows and splits
      unbind '"'
      unbind %
      bind '"' split-window -c "#{pane_current_path}"
      bind v split-window -h -c "#{pane_current_path}"
      bind c new-window -c "#{pane_current_path}"

      # Easy config reload
      bind r source-file ~/.config/tmux/tmux.conf

      # Pane navigation
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      # 256-color support
      set -g default-terminal "screen-256color"
      set-option -sa terminal-overrides ',st-256color:RGB'

      # Color scheme / status bar
      set-option -g status on
      set-option -g status-style bg=colour237,fg=colour223
      set-window-option -g window-status-style bg=colour214,fg=colour237
      set-window-option -g window-status-activity-style bg=colour237,fg=colour248
      set-window-option -g window-status-current-style bg=red,fg=colour237

      # Mouse support
      set -g mouse on

      # Shorter escape delay
      set-option -sg escape-time 10

      # Focus events for Neovim autoread
      set -g focus-events on

      # Pane borders
      set-option -g pane-active-border-style fg=colour250
      set-option -g pane-border-style fg=colour237

      # Message styles
      set-option -g message-style bg=colour239,fg=colour223
      set-option -g message-command-style bg=colour239,fg=colour223

      # Pane number display
      set-option -g display-panes-active-colour colour250
      set-option -g display-panes-colour colour237

      # Clock and bell
      set-window-option -g clock-mode-colour colour109
      set-window-option -g window-status-bell-style bg=colour167,fg=colour235

      # Status bar layout
      set-option -g status-justify "left"
      set-option -g status-left-style none
      set-option -g status-left-length 80
      set-option -g status-right-style none
      set-option -g status-right-length 80
      set-window-option -g window-status-separator ""

      set-option -g status-left "#[bg=colour241,fg=colour248] #S #[bg=colour237,fg=colour241,nobold,noitalics,nounderscore]"
      set-option -g status-right "#[bg=colour237,fg=colour239 nobold, nounderscore, noitalics]#[bg=colour239,fg=colour246] %Y-%m-%d  %H:%M #[bg=colour239,fg=colour248,nobold,noitalics,nounderscore]#[bg=colour248,fg=colour237] #h "
      set-window-option -g window-status-current-format "#[bg=colour214,fg=colour237,nobold,noitalics,nounderscore]#[bg=colour214,fg=colour239] #I #[bg=colour214,fg=colour239,bold] #W#{?window_zoomed_flag,*Z,} #[bg=colour237,fg=colour214,nobold,noitalics,nounderscore]"
      set-window-option -g window-status-format "#[bg=colour239,fg=colour237,noitalics]#[bg=colour239,fg=colour223] #I #[bg=colour239,fg=colour223] #W #[bg=colour237,fg=colour239,noitalics]"

      # Source additional keybindings if present
      if-shell '[ -f ~/.config/tmux/tmux-keybindings.conf ]' 'source-file ~/.config/tmux/tmux-keybindings.conf'
    '';
  };
}
