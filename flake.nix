{
	description = "Home Manager Configuration";

	inputs = {
		nixpkgs.url = "nixpkgs/nixos-24.11";

		home-manager = {
			url = "github:nix-community/home-manager/release-24.11";
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
					./modules
					./modules/profiles/desktop.nix
				];
			};

			minimal = home-manager.lib.homeManagerConfiguration {
				inherit pkgs;
				modules = [
					./modules
					./modules/profiles/minimal.nix
				];
			};
		};
	};
}
