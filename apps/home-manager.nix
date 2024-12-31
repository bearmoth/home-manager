{ config, lib, pkgs, ... }:
let
	cfg = config.home-manager;
in {
	options.home-manager.enable = lib.mkEnableOption "home-manager (a system for managing user environment using Nix package manager)";

	config = lib.mkIf cfg.enable {
		home.packages = with pkgs; [ home-manager ];
	};
}
