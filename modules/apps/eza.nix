{ config, lib, pkgs, ... }:
let
	cfg = config.eza;
in {
	options.eza.enable = lib.mkEnableOption "eza (a modern replacement for ls)";

	config = lib.mkIf cfg.enable {
		home.packages = with pkgs; [ eza ];
	};
}
