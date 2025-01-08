{ config, lib, pkgs, ... }:
let
	cfg = config.eza;
in {
	options.eza.enable = lib.mkEnableOption "eza (a modern replacement for ls)";

	config = lib.mkIf cfg.enable {
		home = {
      packages = with pkgs; [ eza ];
      shellAliases = {
        # Basic ls; allows other eza arguments
        ls = "eza";
        # Extended details with binary sizes and type indicators
        l = "eza --long -bF";
        # Long format, including hidden files
        ll = "eza --long -a";
        # Long format, including hidden files, sorted by modification date
        llm = "eza --long -a --sort=modified";
        # Show all files, with directories listed first
        la = "eza -a --group-directories-first";
        # Show all files and extended attributes, with directories listed first
        lx = "eza -a --group-directories-first --extended";
        # Tree view
        tree = "eza --tree";
        # Display one entry per line
        LS = "eza --oneline";
        # Tree view with extended details
        lT = "eza --tree --long";
        # Recursively list all files, including hidden ones
        lr = "eza --recurse --all";
        # Display entries as a grid with color
        lg = "eza --grid --color=always";
        # List only directories
        ld = "eza --only-dirs";
        # List only files
        lf = "eza --only-files";
        # Use color scale based on file size
        lC = "eza --color-scale=size --long";
        # Display with icons in grid format
        li = "eza --icons=always --grid";
        # Display all entries as hyperlinks
        lh = "eza --hyperlink --all";
        # Sort the grid across, rather than downwards
        lX = "eza --across";
        # Sort by file type in long format
        lt = "eza --long --sort=type";
        # Sort by size in long format
        lsize = "eza --long --sort=size";
        # Sort by modification date in long format, using the modified timestamp
        lmod = "eza --long --modified --sort=modified";
      };
    };
	};
}
