{ config, lib, pkgs, ... }:
let
	cfg = config.lazygit;
in {
	options.lazygit.enable = lib.mkEnableOption "lazygit (tui for git)";

	config = lib.mkIf cfg.enable {
		home = {
      packages = with pkgs; [ lazygit ];
      shellAliases = {
        lg="lazygit";
      };
    };
	};
}
