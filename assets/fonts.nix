{ lib, pkgs, ... }:
let
	fontName = "JetBrainsMono";

in {
	fonts.fontconfig.enable = true;

	home.packages = with pkgs; [
		font-awesome

		#(nerdfonts.override {
		#	fonts = [
		#		fontName
		#	];
		#})
	];
}
