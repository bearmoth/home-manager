{
	description = "Home Manager Configuration";

	inputs = {
		nixpkgs.url = "nixpkgs/nixos-23.11";

		home-manager = {
			url = "github:nix-community/home-manager/release-23.11";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { nixpkgs, home-manager, ... }:
	let
		lib = nixpkgs.lib;
		system = "x86_64-linux";
		pkgs = import nixpkgs { inherit system; };
	in {
		homeConfigurations = {
			desktop = home-manager.lib.homeManagerConfiguration {
				inherit pkgs;
				modules = [
					./home-config.nix
					./profiles/desktop.nix
					./programs
				];
			};

			minimal = home-manager.lib.homeManagerConfiguration {
				inherit pkgs;
				modules = [
					./home-config.nix
					./profiles/minimal.nix
					./programs
				];
			};
		};
	};
}
