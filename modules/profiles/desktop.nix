{ lib, pkgs, ... }:
{
  config = {
    home.homeDirectory = "/home/phil/";

    firefox.enable = true;
    hyprland.enable = true;
    waybar.enable = true;
  };
}
