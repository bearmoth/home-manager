{ config, lib, pkgs, ... }:
let
	cfg = config.waybar;
	cfgPath = "${config.home.configSourceDirectory}/waybar";
in {
  options.waybar.enable = lib.mkEnableOption "waybar ";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [ waybar ];

    programs.waybar = {
      enable = true;
    };

    xdg.configFile.waybar = {
      # An out-of-store symlink is required so Neovim can modify its own lock files.
      source = config.lib.file.mkOutOfStoreSymlink cfgPath;
      recursive = false;
    };
  };
}
