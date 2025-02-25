level=$(brightnessctl --device=tpacpi::kbd_backlight get)

if [ "$level" = "2" ]; then
	brightnessctl --device=tpacpi::kbd_backlight set 0
else
	brightnessctl --device=tpacpi::kbd_backlight set 2
fi
