{ config, lib, pkgs, ... }:
let
	cfg = config.stow;
in {
	options.stow.enable = lib.mkEnableOption "stow (a symlink farm manager)";

	config = lib.mkIf cfg.enable {
		home.packages = with pkgs; [ stow ];
	};
}
