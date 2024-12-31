{ config, lib, pkgs, ... }:
let
	cfg = config.neofetch;
in {
	options.neofetch.enable = lib.mkEnableOption "neofetch (a system information tool)";

	config = lib.mkIf cfg.enable {
		home.packages = with pkgs; [ neofetch ];
	};
}
