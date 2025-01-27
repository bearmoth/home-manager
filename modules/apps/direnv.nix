{ config, lib, pkgs, ... }:
let
	cfg = config.direnv;
in {
	options.direnv.enable = lib.mkEnableOption "direnv (an environment variable manager for shell)";

	config = lib.mkIf cfg.enable {
		home.packages = with pkgs; [ direnv ];

    programs = {
      bash.initExtra = ''
        eval "$(direnv hook bash)"
      '';

      zsh.initExtra = ''
        eval "$(direnv hook zsh)"
      '';
    };
	};
}
