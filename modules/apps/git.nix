{ config, lib, pkgs, ... }:
let
	cfg = config.git;
in {
	options.git.enable = lib.mkEnableOption "git (a distributed version control system)";

	config = lib.mkIf cfg.enable {
		home.packages = with pkgs; [ git ];

		programs.git = {
			enable = true;
			
			userEmail = "7753727+bearmoth@users.noreply.github.com";
			userName = "Phil Davies";
		};
		
	};
}
