{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  programs.vscode = {
    enable = true;
    profiles = {
      default = {
        extensions = with pkgs.vscode-extensions; [
          bbenoist.nix # Nix language support
          jeff-hykin.better-nix-syntax # Nix language support
          ms-vscode.cpptools-extension-pack # C/C++ support
          vscodevim.vim # Vim emulation
          mads-hartmann.bash-ide-vscode
          tamasfe.even-better-toml # toml language support
          zainchen.json # json language support
          shd101wyy.markdown-preview-enhanced # markdown preview
          brettm12345.nixfmt-vscode # Nix formatting
        ];
        userSettings = {
          # General
          "editor.fontSize" = 16;
          "editor.fontFamily" = "'Jetbrains Mono', 'monospace', monospace";
          "editor.rulers" = [
            80
            120
          ];
          "editor.formatOnSave" = true;
          "terminal.integrated.fontSize" = 14;
          "terminal.integrated.fontFamily" = "'JetBrainsMono Nerd Font', 'monospace', monospace";
          "editor.multiCursorModifier" = "ctrlCmd";
          "workbench.startupEditor" = "none";
          "explorer.compactFolders" = false;
          # Whitespace
          "files.trimTrailingWhitespace" = true;
          "files.trimFinalNewlines" = true;
          "files.insertFinalNewline" = true;
          "diffEditor.ignoreTrimWhitespace" = false;
          # Git
          "git.enableCommitSigning" = false;
          "git-graph.repository.sign.commits" = false;
          "git-graph.repository.sign.tags" = false;
          "git-graph.repository.commits.showSignatureStatus" = false;
          # Styling
          "window.autoDetectColorScheme" = true;
          "workbench.preferredDarkColorTheme" = "Default Dark Modern";
          "workbench.preferredLightColorTheme" = "Default Light Modern";
          # Other
          "telemetry.telemetryLevel" = "off";
          "update.showReleaseNotes" = false;
          # Chat
          "chat.tools.terminal.autoApprove" = {
            "nix" = true;
            "pnpm" = true;
            "python" = true;
          };
          # Vim
          "vim.handleKeys" = {
            "<C-a>" = false;
            "<C-f>" = false;
            "<C-p>" = false;
          };
          "vim.useSystemClipboard" = true;
          "keyboard.dispatch" = "keyCode"; # This makes VSCode respect system keyboard mappings
        };
      };
    };
  };
}
