{ config, lib, pkgs, ... }:
{
  config = {
    home.homeDirectory = "/Users/phil/";

    # Slowly opt-in to features to an existing system
    bat.enable = false;
    direnv.enable = false;
    eza.enable = false;
    fd.enable = false;
    fzf.enable = false;
    git.enable = false;
    lazygit.enable = false;
    neofetch.enable = false;
    neovim.enable = false;
    ripgrep.enable = false;
    zoxide.enable = false;
  };
}
