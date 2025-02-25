{ ... }:

{
	programs.wofi = {
		enable = true;

		settings = {
			prompt = "Search...";

			width  = "33%";
			height = "40%";

			mode         = "drun";
			matching     = "fuzzy";
			insensitive  = true;    # Case sensitive
			allow_markup = true;
			allow_images = false;
			layer        = "overlay";
			hide_scroll  = true;

			# drun options
			no_actions        = true;
			always_parse_args = true;
			show_all          = true;
			print_command     = true;
		};

		style = builtins.readFile ./style.css;
	};
}
