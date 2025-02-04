{
	description = "Home Manager Configuration";

	inputs = {
		nixpkgs.url = "nixpkgs/nixos-24.11";

		home-manager = {
			url = "github:nix-community/home-manager/release-24.11";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { nixpkgs, home-manager, nix-darwin, ... }:
	let
		lib = nixpkgs.lib;
		systemLinux = "x86_64-linux";
		systemDarwin = "aarch64-darwin";
    homeManagerConfiguration = home-manager.lib.homeManagerConfiguration;
	in {
		homeConfigurations = {
      # aarch64 based MacOS systems
      darwin = homeManagerConfiguration {
        pkgs = import nixpkgs { system = systemDarwin; };
        modules = [
					./modules
					./modules/profiles/darwin.nix
        ];
      };

      # x86_64 based Linux systems with a desktop environment
			desktop = homeManagerConfiguration {
        pkgs = import nixpkgs { system = systemLinux; };
				modules = [
					./modules
					./modules/profiles/desktop.nix
				];
			};

      # x86_64 based Linux systems with a minimal environment
			minimal = homeManagerConfiguration {
        pkgs = import nixpkgs { system = systemLinux; };
				modules = [
					./modules
					./modules/profiles/minimal.nix
				];
			};
		};
	};
}
