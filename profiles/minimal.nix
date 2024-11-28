{ lib, pkgs, ... }:
{
	home = {
		username = "phil";
		homeDirectory = "/home/phil";

		# You don't need to change this, ever. Not after the first build. Don't ask questions!
		stateVersion = "23.11";
	};

	shell-utils.enable = true;
}
