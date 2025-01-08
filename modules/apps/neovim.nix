{ config, lib, pkgs, ... }:
let
	cfg = config.neovim;
	cfgPath = "${config.home.configSourceDirectory}/nvim";
in  {
  options.neovim.enable = lib.mkEnableOption "neovim (a hyperextensible text editor)";

  config = lib.mkIf cfg.enable {
    xdg.configFile.nvim = {
      # An out-of-store symlink is required so Neovim can modify its own lock files.
      source = config.lib.file.mkOutOfStoreSymlink cfgPath;
      recursive = false;
    };

    home = {
      packages = with pkgs; [ neovim ];
      shellAliases = {
        nv = "nvim";
        vim = "nvim";
        vimdiff = "nvim -d";
      };
    };
  };
}
