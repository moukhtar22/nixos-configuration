{ config, lib, ... }:

{
  wayland.windowManager.hyprland.settings = {
    monitor = [
      "DP-2, 1920x1080@75, 0x0, 1.0"
      "DP-3, 1920x1080@75, 1920x0, 1.0"
    ];
  }; 
}
