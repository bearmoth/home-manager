{ config, lib, pkgs, ... }:
let
	cfg = config.firefox;
in {
	options.firefox.enable = lib.mkEnableOption "firefox (a web browser)";

	config = lib.mkIf cfg.enable {
		home.packages = with pkgs; [ firefox ];
	};
}
