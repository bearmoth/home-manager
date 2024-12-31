{ config, lib, pkgs, ... }:
let
	cfg = config.bat;
in {
	options.bat.enable = lib.mkEnableOption "bat (a modern replacement for cat)";

	config = lib.mkIf cfg.enable {
		home.packages = with pkgs; [ bat ];
	};
}
