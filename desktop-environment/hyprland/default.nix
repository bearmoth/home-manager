{ config, lib, pkgs, ... }:
let
	cfg = config.hyprland;
in {
	options.hyprland.enable = lib.mkEnableOption "hyprland (a modern replacement for cat)";

	config = lib.mkIf cfg.enable {
		home.file.".config/hypr/hyprland.conf".source = ./hyprland.conf;
	};
}
