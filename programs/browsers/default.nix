{ config, lib, ... }:
let
	cfg = config.browsers;
in {
	imports = [ ./firefox.nix ];

	options.browsers.enable = lib.mkEnableOption "browsers";

	config = lib.mkIf cfg.enable {
		# Enabled by default
		firefox.enable = lib.mkDefault true;
	};
}
