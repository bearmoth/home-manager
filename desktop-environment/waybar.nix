{ config, lib, pkgs, ... }:
let
	cfg = config.waybar;
	cfgPath = "${config.home.configSourceDirectory}/waybar";
in {
	home.packages = with pkgs; [ waybar ];

	programs.waybar = {
		enable = true;
	};

	xdg.configFile.waybar = {
    # An out-of-store symlink is required so Neovim can modify its own lock files.
    source = config.lib.file.mkOutOfStoreSymlink cfgPath;
    recursive = false;
	};
}
