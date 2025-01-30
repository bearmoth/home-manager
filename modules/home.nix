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
    home = {
    	username = "phil";
      homeDirectory = "/home/phil";
      sessionVariables = {
        EDITOR = "VIM";
      };

    	# You don't need to change this after the first build, ever.
    	# Don't ask questions!
    	stateVersion = "23.11";
    };
      
    xdg.enable = true;
  };
}
