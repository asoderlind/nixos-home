{ pkgs, userEmail ? "axesode@gmail.com", ... }:
{
  programs.git = {
    enable = true;
    userName = "asoderlind";
    userEmail = userEmail;
    extraConfig = {
      github.user = "asoderlind";
      push.autoSetupRemote = true;
      credential.helper = "store --file ~/.git-credentials";
      pull.rebase = "false";
      core.editor = "vim";
      core.whiteSpace = "fix,-indent-with-non-tab,trailing-space,cr-at-eol";
      merge.tool = "nvimdiff";
      init.defaultBranch = "master";
      color.ui = true;
    };
  };
}
