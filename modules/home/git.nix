{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "asoderlind";
        email = "axesode@gmail.com";
      };
      github.user = "asoderlind";
      push.autoSetupRemote = true;
      credential.helper = "store --file ~/.git-credentials";
      pull.rebase = "false";
      core = {
        editor = "vim";
        whiteSpace = "fix,-indent-with-non-tab,trailing-space,cr-at-eol";
      };
      merge.tool = "nvimdiff";
      init.defaultBranch = "master";
      color.ui = true;
      # Disable GPG signing since no key is configured
      commit.gpgsign = false;
      tag.gpgsign = false;
    };
  };
}
