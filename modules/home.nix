{ config, lib, ... }:
let
  repoDirectory = "${config.xdg.configHome}/home-manager";
  cfg = config.home;
in {
	options.home = {
	   configSourceDirectory = lib.mkOption {
	     default = "${repoDirectory}/config";
	     type = lib.types.str;
	   };
	};

	config = {
# TODO: these need a new home
    home.sessionVariables.EDITOR = "VIM";
    xdg.enable = true;
  };
}
