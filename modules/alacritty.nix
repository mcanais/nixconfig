{ ... }:

{
	programs.alacritty = {
		enable = true;

		settings = {
			window = {
				padding = { x = 0; y = 0; };
				opacity = 0.85;
			};

			font = {
				offset = { x = 0; y = 2; };
				normal = {
					family = "Cousine";
					style = "Regular";
				};
			};

			cursor = {
				style = {
					shape = "Underline";
					blinking = "On";
				};
				vi_mode_style = {
					shape = "Block";
					blinking = "Never";
				};
			};

			colors = {
				primary = {
					background = "#181616";
					foreground = "0xadbac7";
				};

				cursor = {
					text = "0x22272e";
					cursor = "0xadbac7";
				};

				normal = {
					black = "0x545d68";
					red = "0xf47067";
					green = "0x57ab5a";
					yellow = "0xc69026";
					blue = "0x539bf5";
					magenta = "0xb083f0";
					cyan = "0x39c5cf";
					white = "0x909dab";
				};

				bright = {
					black = "0x636e7b";
					red = "0xff938a";
					green = "0x6bc46d";
					yellow = "0xdaaa3f";
					blue = "0x6cb6ff";
					magenta = "0xb083f0";
					cyan = "0x39c5cf";
					white = "0x909dab";
				};
			};
		};
	};
}
