{
	description = "Home Manager Configuration";

	inputs = {
		nixpkgs.url = "nixpkgs/nixos-24.11";

		home-manager = {
			url = "github:nix-community/home-manager/release-24.11";
			inputs.nixpkgs.follows = "nixpkgs";
		};

    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
	};

	outputs = { nixpkgs, home-manager, nix-darwin, ... }:
	let
		lib = nixpkgs.lib;
		systemLinux = "x86_64-linux";
		systemDarwin = "x86_64-darwin";
	in {
		homeConfigurations = {
			desktop = home-manager.lib.homeManagerConfiguration {
				inherit pkgs;
        pkgs = import nixpkgs { system = systemLinux };
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

    darwinConfigurations = {
      work = {
        pkgs = import nixpkgs { system = systemDarwin };
        modules = [];
      };
    };
	};
}
