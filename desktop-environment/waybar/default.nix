{ config, lib, pkgs, ... }:
let
	cfg = config.waybar;
in {
	home.packages = with pkgs; [ waybar ];

	programs.waybar = {
		enable = true;
	};

	xdg.configFile.waybar = {
		target = "waybar/config";
		source = config.lib.file.mkOutOfStoreSymlink "/home/phil/home-manager/desktop-environment/waybar/config";
	};
}
