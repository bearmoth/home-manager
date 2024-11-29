{ config, lib, pkgs, ... }:
let
	cfg = config.neovim;
in {
	options.neovim.enable = lib.mkEnableOption "neovim (a hyperextensible Vim-based text editor)";
	
	config = lib.mkIf cfg.enable {
		home.packages = with pkgs; [ neovim ];

		home.file = {
			".config/nvim".source = ./.config/nvim;
		};
	};
}
