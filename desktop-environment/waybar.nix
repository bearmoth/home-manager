{ config, lib, pkgs, ... }:
let
	cfg = config.waybar;
in {
	home.packages = with pkgs; [ waybar ];

	programs.waybar = {
		enable = true;
	};

	xdg.configFile.waybar = {
    # An out-of-store symlink is required so Neovim can modify its own lock files.
    # Unfortunately, an absolute path must be given, otherwise Nix creates a symlink
    # to its store.
    source = config.lib.file.mkOutOfStoreSymlink "/home/phil/home-manager/config/waybar";
    recursive = false;
	};
}
