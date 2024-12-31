{ config, lib, ... }:
let
	cfg = config.shell-utils;
in {
	imports = [
		./bat.nix
		./direnv.nix
		./eza.nix
		./fd.nix
		./firefox.nix
		./fzf.nix
		./git.nix
		./home-manager.nix
		./lazygit.nix
		./neofetch.nix
		./ripgrep.nix
		./stow.nix
		./zoxide.nix
	];

	options.shell-utils.enable = lib.mkEnableOption "shell-utils";

	config = lib.mkIf cfg.enable {
		# Enabled by default
		bat.enable = lib.mkDefault true;
		direnv.enable = lib.mkDefault true;
		eza.enable = lib.mkDefault true;
		fd.enable = lib.mkDefault true;
		fzf.enable = lib.mkDefault true;
		git.enable = lib.mkDefault true;
		home-manager.enable = lib.mkDefault true;
		lazygit.enable = lib.mkDefault true;
		neofetch.enable = lib.mkDefault true;
		ripgrep.enable = lib.mkDefault true;
		zoxide.enable = lib.mkDefault true;

		# Disabled by default	
		firefox.enable = lib.mkDefault false;
		stow.enable = lib.mkDefault false;
	};
}
