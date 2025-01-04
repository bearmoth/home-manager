{ config, lib, pkgs, ... }:
let
	cfg = config.hyprland;
in {
	options.hyprland.enable = lib.mkEnableOption "hyprland (a window tiling manager)";

	# To reload Hyprland after altering configuration, run: hyprctl reload
	# 
	config = lib.mkIf cfg.enable {
    xdg.configFile.hypr = {
      # An out-of-store symlink is required so Neovim can modify its own lock files.
      # Unfortunately, an absolute path must be given, otherwise Nix creates a symlink
      # to its store.
      source = config.lib.file.mkOutOfStoreSymlink "/home/phil/home-manager/config/hypr";
      recursive = false;
    };
	};
}
