{ config, lib, ... }:
let
	user = "phil";
  homePath = "/home";
  repoDirectory = "home-manager";
  cfg = config.home;
in {
	options.home = {
	   configSourceDirectory = lib.mkOption {
	     default = "${cfg.homeDirectory}/${repoDirectory}/config";
	     type = lib.types.str;
	   };
	};

	config = {
    home = {
    	username = user;
      homeDirectory = "${homePath}/${user}";

    	# You don't need to change this after the first build, ever.
    	# Don't ask questions!
    	stateVersion = "23.11";

    };
      
    xdg.enable = true;
  };
}
