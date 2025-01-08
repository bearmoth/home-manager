{ config, lib, pkgs, ... }:
let
  cfg = config.bash;
in {
  options.bash.enable = lib.mkEnableOption "bash (bourne again shell)";

  config =  lib.mkIf cfg.enable {
    programs.bash = {
      enable = true;
      initExtra = ''
        # Source any session variables managed by home-manager
        source $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh
      '';
    };
  };
}
