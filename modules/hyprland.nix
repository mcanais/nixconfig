{ lib, ... }:

{
	imports = [
		./wofi
		./waybar
	];

	services.hyprpaper = {
		enable = true;

		settings = {
			preload = [ "$HOME/Wallpapers/sunset_mountains.jpg" ];
			wallpaper = [ ", $HOME/Wallpapers/sunset_mountains.jpg" ];
		};
	};

	wayland.windowManager.hyprland = {
		enable = true;
		systemd.enable = true;
		xwayland.enable = true;

		settings = {
			monitor = ",preferred,auto,1.333333";

			xwayland = {
				force_zero_scaling = true;
			};

			env = [
				"XCURSOR_SIZE,20"
				"XCURSOR_THEME,Bibata-Modern-Ice"
			];

			exec-once = [
				"waybar"
				"hyprpaper"
			];

			general = {
				gaps_in = 2;
				gaps_out = 4;

				border_size = 1;

				"col.active_border" = "rgba(ffffffaa)";
				"col.inactive_border" = "rgba(595959aa)";

				resize_on_border = false;

				allow_tearing = false;

				layout = "dwindle";
			};


			decoration = {
				rounding = 8;
				active_opacity = 1;
				inactive_opacity = 0.9;

				shadow = {
					enabled = true;
					range = 4;
					render_power = 3;
					color = "rgba(1a1a1aee)";
				};

				blur = {
					enabled = true;
					size = 15;
					passes = 1;

					vibrancy = 0.15;
				};
			};


			animations = {
				enabled = "yes, please :)";

				bezier = [
					"easeOutQuint,0.23,1,0.32,1"
					"easeInOutCubic,0.65,0.05,0.36,1"
					"linear,0,0,1,1"
					"almostLinear,0.5,0.5,0.75,1.0"
					"quick,0.15,0,0.1,1"
				];

				animation = [ 
					"global, 1, 10, default"
					"border, 1, 5.39, easeOutQuint"
					"windows, 1, 4.79, easeOutQuint"
					"windowsIn, 1, 4.1, easeOutQuint, popin 87%"
					"windowsOut, 1, 1.49, linear, popin 87%"
					"fadeIn, 1, 1.73, almostLinear"
					"fadeOut, 1, 1.46, almostLinear"
					"fade, 1, 3.03, quick"
					"layers, 1, 3.81, easeOutQuint"
					"layersIn, 1, 4, easeOutQuint, fade"
					"layersOut, 1, 1.5, linear, fade"
					"fadeLayersIn, 1, 1.79, almostLinear"
					"fadeLayersOut, 1, 1.39, almostLinear"
					"workspaces, 1, 1.94, almostLinear, fade"
					"workspacesIn, 1, 1.21, almostLinear, fade"
					"workspacesOut, 1, 1.94, almostLinear, fade"
				];
			};

			dwindle = {
				pseudotile = true;
				preserve_split = true;
			};

			master = {
				new_status = "master";
			};

			misc = {
				force_default_wallpaper = 0;
				disable_hyprland_logo = true;
			};


			input = {
				kb_layout = "pt";
				kb_variant = "";
				kb_model = "";
				kb_options = "";
				kb_rules = "";

				follow_mouse = 1;

				sensitivity = 0; # -1.0 - 1.0, 0 means no modification

				repeat_delay = 150;

				touchpad = {
					natural_scroll = false;
				};
			};

			gestures = {
				workspace_swipe = false;
			};

		};

		extraConfig = 
		let
			modifier = "SUPER";
			scripts = ../scripts;
		in
		lib.concatStrings [
		  ''	
			# MAIN
			bind = ${modifier}, Backspace, killactive
			bind = ${modifier}, V, togglefloating
			bind = ${modifier}, F, fullscreen
			bind = ${modifier} SHIFT, E, exit
			bind = ${modifier} SHIFT, S, exec, systemctl poweroff
			bind = ${modifier} SHIFT, R, exec, systemctl reboot


			# EXECUTION
			bind = ${modifier}, Return, exec, alacritty --working-directory $HOME
			bind = ${modifier}, B, exec, $BROWSER
			bind = ${modifier}, R, exec, pidof $MENU || $MENU
			bind =         , Print, exec, ${scripts}/printscreen.sh
			bind = SHIFT   , Print, exec, ${scripts}/printscreen.sh -f

			# WINDOW FOCUS
			bind = ${modifier}, left, movefocus, l
			bind = ${modifier}, right, movefocus, r
			bind = ${modifier}, up, movefocus, u
			bind = ${modifier}, down, movefocus, d
			bind = ${modifier}, Tab, cyclenext


			# WINDOW POSITION
			bind = ${modifier} SHIFT, left, movewindow, l
			bind = ${modifier} SHIFT, right, movewindow, r
			bind = ${modifier} SHIFT, up, movewindow, u
			bind = ${modifier} SHIFT, down, movewindow, d 
			bind = ${modifier}, T, togglesplit
			bindm = ${modifier}, mouse:272, movewindow

			# WINDOW SIZE
			binde = ${modifier}, H, resizeactive, -10 0
			binde = ${modifier}, L, resizeactive, 10 0
			binde = ${modifier}, J, resizeactive, 0 10
			binde = ${modifier}, K, resizeactive, 0 -10
			bindm = ${modifier}, mouse:273, resizewindow

			# SELECT WORKSPACE
			bind = ${modifier}, 1, workspace, 1
			bind = ${modifier}, 2, workspace, 2
			bind = ${modifier}, 3, workspace, 3
			bind = ${modifier}, 4, workspace, 4
			bind = ${modifier}, 5, workspace, 5
			bind = ${modifier}, 6, workspace, 6
			bind = ${modifier}, 7, workspace, 7
			bind = ${modifier}, 8, workspace, 8
			bind = ${modifier}, 9, workspace, 9
			bind = ${modifier}, 0, workspace, 10

			bind = ${modifier}, mouse_down, workspace, e+1
			bind = ${modifier}, mouse_up, workspace, e-1

			# MOVE WINDOW TO WORKSPACE
			bind = ${modifier} SHIFT, 1, movetoworkspace, 1
			bind = ${modifier} SHIFT, 2, movetoworkspace, 2
			bind = ${modifier} SHIFT, 3, movetoworkspace, 3
			bind = ${modifier} SHIFT, 4, movetoworkspace, 4
			bind = ${modifier} SHIFT, 5, movetoworkspace, 5
			bind = ${modifier} SHIFT, 6, movetoworkspace, 6
			bind = ${modifier} SHIFT, 7, movetoworkspace, 7
			bind = ${modifier} SHIFT, 8, movetoworkspace, 8
			bind = ${modifier} SHIFT, 9, movetoworkspace, 9
			bind = ${modifier} SHIFT, 0, movetoworkspace, 10


			# AUDIO
			bindel = , XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
			bindel = , XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
			bindel = , XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
			bindel = , XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
			bindl = , XF86AudioNext, exec, playerctl next
			bindl = , XF86AudioPause, exec, playerctl play-pause
			bindl = , XF86AudioPlay, exec, playerctl play-pause
			bindl = , XF86AudioPrev, exec, playerctl previous


			# BRIGHTNESS
			bindel = , XF86MonBrightnessUp, exec, brightnessctl s 10%+
			bindel = , XF86MonBrightnessDown, exec, brightnessctl s 10%-
			bind = ${modifier}, Space, exec, ${scripts}/kbd_backlight_toggle.sh # Toggle keyboard backlight

			# CUSTOM DEVICE CONFIG
			device {
				name = keychron--keychron-link--keyboard
				kb_layout = us
			}

			device {
				name = keychron-k2-he-keyboard
				kb_layout = us
			}
		  ''
		];
	};
}
