{ config, lib, pkgs, ... }:
let
	cfg = config.fzf;
in {
	options.fzf.enable = lib.mkEnableOption "fzf (a command-line fuzzy finder)";

	config = lib.mkIf cfg.enable {
		home.packages = with pkgs; [ fzf ];
	};
}
