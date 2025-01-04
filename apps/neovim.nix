{ config, lib, pkgs, ... }:
let
  cfg = config.neovim;
in  {
  options.neovim.enable = lib.mkEnableOption "neovim (a hyperextensible text editor)";

  config = lib.mkIf cfg.enable {
    xdg.configFile.nvim = {
      # An out-of-store symlink is required so Neovim can modify its own lock files.
      # Unfortunately, an absolute path must be given, otherwise Nix creates a symlink
      # to its store.
      source = config.lib.file.mkOutOfStoreSymlink "/home/phil/home-manager/config/nvim";
      recursive = false;
    };
   
    home.packages = with pkgs; [ neovim ];
  };
}
