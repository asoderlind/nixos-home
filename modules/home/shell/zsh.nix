{
  pkgs,
  ...
}:
{
  programs.fzf.enable = true;
  programs.fzf.defaultOptions = [ "--color=16" ];

  # Enable zsh
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    autocd = true;

    # History settings
    history = {
      size = 10000;
      save = 10000;
      path = "$HOME/.cache/.zsh_history";
    };
    shellAliases = {
      cat = "bat";
      ga = "git add -A; gs";
      gc = "git commit -v";
      gd = "git diff";
      gl = "git log";
      gitlog = "git log --all --graph --pretty=format:'%Cred%h%Creset %C(bold blue)%an%Creset :%C(yellow)%d%Creset %s %Cgreen(%cr) %Creset' --abbrev-commit";
      gp = "git push";
      gs = "git status";
      gu = "git pull";
      gcb = "git checkout -b";
      gcm = "git checkout master && git pull";
      ll = "ls -lh";
      lz = "ps axo pid=,stat= | awk '\$2~/^Z/ { print \$1 }'";
      update = "sudo nixos-rebuild switch --flake ~/repos/nixos-config";
      copy-to-clipboard = "xclip -selection clipboard";
    };
    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-autosuggestions"; } # Simple plugin installation
        { name = "zsh-users/zsh-syntax-highlighting"; }
      ];
    };
    initContent = ''
      	    # VCS info
      	    autoload -Uz vcs_info
      	    zstyle ':vcs_info:*' enable git svn
      	    zstyle ':vcs_info:git*' formats "  %b "
      	    precmd() { vcs_info }

      	    # Prompt colors
      	    autoload -U colors && colors
      	    setopt prompt_subst
      	    PS1='%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$vcs_info_msg_0_$%b '

      	    # UTF-8 support
      	    export LC_ALL=en_US.UTF-8
      	    export LANG=en_US.UTF-8

      	    # Completion settings
      	    zmodload zsh/complist
      	    _comp_options+=(globdots)
      	    zstyle ':completion:*' menu select

      	    # lf directory switch function
      	    bindkey -s '^f' 'cd "$(dirname "$(fzf)")"\n'

      	    # Run ls after cd
      	    chpwd() ls -a

      	    # Load user keybindings and plugins from .config
      	    [ -f "$HOME/.config/zsh/keybindings" ] && source "$HOME/.config/zsh/keybindings"

      	    # pnpm
      	    export PNPM_HOME="$HOME/.local/share/pnpm"
      	    case ":$PATH:" in
      	      *":$PNPM_HOME:"*) ;;
      	      *) export PATH="$PNPM_HOME:$PATH" ;;
      	    esac

      	    # ghcup
      	    [ -f "$HOME/.ghcup/env" ] && . "$HOME/.ghcup/env"
      	  '';
    profileExtra = ''
      					export XDG_DATA_DIRS=$HOME/.nix-profile/share:/usr/local/share:/usr/share

      					[ -f "/opt/homebrew/bin/brew" ] && eval "$(/opt/homebrew/bin/brew shellenv)"

      					export PATH=$PATH:$HOME/.local/bin

      					export EDITOR="nvim"
      					export VISUAL="nvim"
      					alias vim=nvim

      					export FZF_DEFAULT_COMMAND='rg --files --hidden'
      					export FZF_DEFAULT_OPTS='--color=16'
      				  '';

  };
}
