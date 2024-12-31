{ config, lib, pkgs, ... }:
let
	cfg = config.fd;
in {
	options.fd.enable = lib.mkEnableOption "fd (a modern replacement for find)";

	config = lib.mkIf cfg.enable {
		home.packages = with pkgs; [ fd ];
	};
}
