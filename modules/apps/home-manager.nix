{ config, lib, pkgs, ... }:
let
	cfg = config.home-manager;
in {
	options.home-manager.enable = lib.mkEnableOption "home-manager (a system for managing user environment using Nix package manager)";

	config.home = {
    packages = with pkgs; lib.mkIf cfg.enable [ home-manager ];

    # TODO: make configurable
    username = "phil";
    
    # You don't need to change this after the first build, ever.
    # Don't ask questions!
    stateVersion = "23.11";
  };
}
