{ config, lib, pkgs, ... }:
let
	cfg = config.hyprland;
in {
	options.hyprland.enable = lib.mkEnableOption "hyprland (a window tiling manager)";

	# To reload Hyprland after altering configuration, run: hyprctl reload
	# 
	config = lib.mkIf cfg.enable {
		home.file = {
			".config/hypr/hyprland.conf".source = ./hyprland.conf;

			".config/hypr/autostart.conf".source = ./autostart.conf;
			".config/hypr/env_variables.conf".source = ./env_variables.conf;
			".config/hypr/input.conf".source = ./input.conf;
			".config/hypr/monitors.conf".source = ./monitors.conf;
			".config/hypr/programs.conf".source = ./programs.conf;
			".config/hypr/theme.conf".source = ./theme.conf;
			".config/hypr/windows_and_workspaces.conf".source = ./windows_and_workspaces.conf;
		};
	};
}
