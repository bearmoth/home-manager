{ config, lib, pkgs, ... }:
let
	cfg = config.hyprland;
  cfgPath = "${config.home.configSourceDirectory}/hypr";
in {
	options.hyprland.enable = lib.mkEnableOption "hyprland (a window tiling manager)";

	# To reload Hyprland after altering configuration, run: hyprctl reload
	# 
	config = lib.mkIf cfg.enable {
    xdg.configFile.hypr = {
      # An out-of-store symlink is required so Neovim can modify its own lock files.
      source = config.lib.file.mkOutOfStoreSymlink cfgPath;
      recursive = false;
    };
	};
}
