{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Asep5K";
        email = "Asep5K@proton.me";
        signingKey = "5ABD855D031E0957";
      };
      url = {
        "ssh://git@codeberg.org/".insteadOf = "https://codeberg.org/";
        "ssh://git@github.com/".insteadOf = "https://github.com/";
        "git@ghasep:Asep5K/".insteadOf = [
          "https://github.com/Asep5K/"
          "git@github.com:Asep5K/"
        ];
      };
      core = {
        sshCommand = "ssh -i ~/.ssh/git/git";
      };
      init.defaultBranch = "main";
      commit.gpgSign = true;
      tag.gpgSign = true;
      alias = {
        br = "branch";
        st = "status";
        ci = "commit";
        cim = "commit -m";
        hide = "!git update-index --skip-worktree";
        unhide = "!git update-index --no-skip-worktree";
      };
    };
  };

}
