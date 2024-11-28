{ config, lib, pkgs, ... }:
let
	cfg = config.ripgrep;
in {
	options.ripgrep.enable = lib.mkEnableOption "ripgrep (a modern replacement for grep)";

	config = lib.mkIf cfg.enable {
		home.packages = with pkgs; [ ripgrep ];
	};
}
