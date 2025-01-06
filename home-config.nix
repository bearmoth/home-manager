{ config, lib, ... }:
let
	username = "phil";
  homePath = "/home";
  cfg = config.home;
in {
	options.home = {
	   configSourceDirectory = lib.mkOption {
	     default = "${cfg.homeDirectory}/home-manager/config";
	     type = lib.types.str;
	   };
	};

	config = {
    home = {
    	inherit username;
    	
      homeDirectory = "${homePath}/${username}";

    	# You don't need to change this after the first build, ever.
    	# Don't ask questions!
    	stateVersion = "23.11";

    };
      
    xdg.enable = true;
  };
}
