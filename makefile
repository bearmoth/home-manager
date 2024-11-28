.PHONY: minimal
minimal:
	home-manager switch --flake .#minimal

.PHONY: clean
clean:
	nix-collect-garbage -d
