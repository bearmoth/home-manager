{ config, lib, pkgs, ... }:
let
	cfg = config.waybar;
in {
	options.waybar.enable = lib.mkEnableOption "waybar (a status bar for Wayland based compositors)";

	config = lib.mkIf cfg.enable {
		home.packages = with pkgs; [ waybar ];

		programs.waybar = {
			enable = true;
		};
	};
}
