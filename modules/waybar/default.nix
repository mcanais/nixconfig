{ ... }:

{
	programs.waybar = {
		enable = true;

		settings.mainBar = {
			layer = "top";
			position = "top";
			
			height = 30;

			modules-left = [
				"custom/os_button"
				"hyprland/workspaces"
			];

			modules-right = [
				"cpu" 
				"memory" 
				"custom/spacing" 
				"pulseaudio" 
				"bluetooth" 
				"network" 
				"battery" 
				"clock"
			];

			"hyprland/workspaces" = {};

			"custom/spacing" = {
				format = " ";
				tooltip = false;
			};
			
			"custom/os_button" = {
				format = "";
				on-click = "pidof wofi || wofi --show drun";
				tooltip = false;
			};
			
			"cpu"= {
				interval = 5;
				format = "{usage}% ";
			};
			
			"memory" = {
				format = "{}% ";
				format-alt = "{used:0.1f} GiB ";
				tooltip-format = "{used:0.1f}/{total:0.1f} GiB";
			};

			"pulseaudio"= {
				format = "{volume}% {icon}";
				tooltip-format = "{volume}%";
				format-muted = "";
				format-icons = {
					default = [
						""
						""
					];
				};
			};

			"bluetooth" = {
				format = "";
				format-off = "";
				format-disabled = "";
				tooltip-format = "{status}";
				tooltip-format-connected = "{device_alias} {status} ({device_battery_percentage}%)";
				on-click = "alacritty -e bluetoothctl";
			};

			"network"= {
				format = "{icon}";
				tooltip-format = "{essid} ({signalStrength}%)";
				format-disconnected = "";
				format-icons = [
					"󰤯 "
					"󰤟 "
					"󰤢 "
					"󰤢 "
					"󰤨 "
				];
			};

			"battery"= {
				states = {
					"critical" = 15;
				};
				format = "{capacity}% {icon}";
				format-charging = "{capacity}% ";
				format-plugged = "{capacity}% ";
				format-icons = [
					"󰂎"
					"󰁺"
					"󰁻"
					"󰁼"
					"󰁽"
					"󰁾"
					"󰁿"
					"󰂀"
					"󰂁"
					"󰂂"
					"󰁹"
				];
				tooltip-format = "{capacity}% - {time}";
			};
			
			"clock" = {
				format = "{:%R}";
				tooltip-format = "{:%A, %d/%m/%y}";
			};
		};

		style = builtins.readFile ./style.css;
	};
}
