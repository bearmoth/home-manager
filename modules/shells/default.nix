{ lib, ... }: {
  imports = [ ./bash.nix ];

  bash.enable = lib.mkDefault true;
}
