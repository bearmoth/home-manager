{ ... }:
let
	user = "phil";
in {
	home = {
		username = user;
		homeDirectory = "/home/${user}";

		# You don't need to change this after the first build, ever.
		# Don't ask questions!
		stateVersion = "23.11";
	};
}
