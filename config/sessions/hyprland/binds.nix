{ config, pkgs, ... }:

{
   wayland.windowManager.hyprland.settings = {
      "$mainMod" = "SUPER";
      "$terminal" = "kitty";
      bindm = [
         "$mainMod, mouse:272, movewindow"
	 "$mainMod, mouse:273, resizewindow"
      ];
      binde = [
        "$mainMod&SHIFT_L, left, resizeactive,-50 0"
	"$mainMod&SHIFT_L, right, resizeactive,50 0"
	"$mainMod&SHIFT_L, up, resizeactive,0 -50"
	"$mainMod&SHIFT_L, down, resizeactive,0 50"
      ];
      
      bindl = [
         "SHIFT_L, ALT_L, exec, hyprctl switchxkblayout main next"
         "ALT_L, SHIFT_L, exec, hyprctl switchxkblayout main prev"
	 "$mainMod, SPACE, exec, playerctl play-pause"
	 ", xf86AudioMicMute, exec, ${./scripts/volume.sh} --toggle-mic"
	 ", xf86audiomute, exec, ${./scripts/volume.sh} --toggle"
	 ", XF86MonBrightnessDown, exec, ${./scripts/brightness.sh} --dec"
  	 ", XF86MonBrightnessUp, exec, ${./scripts/brightness.sh} --inc"
	 ", Print, exec, ${./scripts/screenshot.sh}"
	 ", XF86PowerOff, exec, hyprlock"
      ];
      bindel = [
         ", xf86audiolowervolume, exec, ${./scripts/volume.sh} --dec"
	 ", xf86audioraisevolume, exec, ${./scripts/volume.sh} --inc"
	 "$mainMod, L, exec, hyprlock"	
      ];
      bind =
      [	
	 #"$mainMod, D, exec, bash ~/.config/eww/dashboard/launch_dashboard"
	 "$mainMod&SHIFT_L, R, exec, bash ~/.config/eww/bar/launch_bar.sh"
	 "$mainMod, D, exec, bash ${./scripts/rofi_show.sh} drun"
	 "$mainMod, S, exec, bash ~/.config/eww/bar/scripts/open_eww.sh calendar_win"
	 "ALT, TAB, exec, bash ${./scripts/rofi_show.sh} window"
	 "$mainMod, TAB, exec, bash ${./scripts/quicklinks.sh}"
	 "$mainMod, C, exec, bash ${./scripts/rofi_clipboard.sh}"
	 "$mainMod, M, exec, bash ${./scripts/monitors.sh}"
	 # "$mainMod&SHIFT_L, P, exec, ${./scripts/power-profiles.sh}"
         "$mainMod, A, exec, swaync-client -t -sw"
	 "$mainMod&SHIFT_L, F, togglefloating,"
	 # "$mainMod, S, exec, bash ${./scripts/toggle_control_center.sh}"
	 "$mainMod&SHIFT_L, S, exec, bash ${./scripts/search_bar.sh}"
         "$mainMod, Q, exec, bash ~/.config/eww/bar/scripts/open_eww.sh music_win"
	 "$mainMod, N, exec, bash ~/.config/eww/bar/scripts/open_eww.sh network_win"
	 "$mainMod, B, exec, bash ~/.config/eww/bar/scripts/open_eww.sh battery_win"
         "$mainMod, F, exec, firefox"
         "$mainMod, E, exec, nautilus"
         "$mainMod, T, exec, Telegram"
	 "$mainMod, O, exec, obsidian"
         "$mainMod, RETURN, exec, $terminal"

         "ALT, F4, killactive"

	 "$mainMod&CTRL, left, movewindow, l"
	 "$mainMod&CTRL, right, movewindow, r"
	 "$mainMod&CTRL, up, movewindow, u"
	 "$mainMod&CTRL, down, movewindow, d"

	 "$mainMod, left, movefocus, l"
	 "$mainMod, right, movefocus, r"
	 "$mainMod, up, movefocus, u"
	 "$mainMod, down, movefocus, d"

         "$mainMod, 1, exec, ${./scripts/close_eww.sh} 1"
         "$mainMod, 2, exec, ${./scripts/close_eww.sh} 2"
         "$mainMod, 3, exec, ${./scripts/close_eww.sh} 3"
         "$mainMod, 4, exec, ${./scripts/close_eww.sh} 4"
         "$mainMod, 5, exec, ${./scripts/close_eww.sh} 5"
         "$mainMod, 6, exec, ${./scripts/close_eww.sh} 6"
         "$mainMod, 7, exec, ${./scripts/close_eww.sh} 7"
         "$mainMod, 8, exec, ${./scripts/close_eww.sh} 8"
         "$mainMod, 9, exec, ${./scripts/close_eww.sh} 9"
         "$mainMod, 0, exec, ${./scripts/close_eww.sh} 10"

          "$mainMod SHIFT, 1, exec, ${./scripts/close_eww.sh} 1 move"
          "$mainMod SHIFT, 2, exec, ${./scripts/close_eww.sh} 2 move"
          "$mainMod SHIFT, 3, exec, ${./scripts/close_eww.sh} 3 move"
          "$mainMod SHIFT, 4, exec, ${./scripts/close_eww.sh} 4 move"
          "$mainMod SHIFT, 5, exec, ${./scripts/close_eww.sh} 5 move"
          "$mainMod SHIFT, 6, exec, ${./scripts/close_eww.sh} 6 move"
          "$mainMod SHIFT, 7, exec, ${./scripts/close_eww.sh} 7 move"
          "$mainMod SHIFT, 8, exec, ${./scripts/close_eww.sh} 8 move"
          "$mainMod SHIFT, 9, exec, ${./scripts/close_eww.sh} 9 move"
          "$mainMod SHIFT, 0, exec, ${./scripts/close_eww.sh} 10 move"
     ]; 
  };

}

