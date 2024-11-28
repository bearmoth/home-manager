{ config, lib, pkgs, ... }:
let
	cfg = config.zoxide;
in {
	options.zoxide.enable = lib.mkEnableOption "zoxide (a modern replacement for cd)";

	config = lib.mkIf cfg.enable {
		home.packages = with pkgs; [ zoxide ];
	};
}
