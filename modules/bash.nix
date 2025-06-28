{ ... }:

{
	programs.bash = {
		enable = true;

		initExtra = ''
			PS1=' \[\e[31m\]\w ❯ \[\e[0m\]'

			function y() {
				local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
				yazi "$@" --cwd-file="$tmp"
				if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
					cd -- "$cwd"
				fi
				rm -f -- "$tmp"
			}

			function nf() {
				local res=$(fzf)
				if [ $? -eq 0 ]; then
					nvim $res
				fi
			}

			export PATH=$PATH:${../scripts}:$HOME/scripts
		'';

		profileExtra = ''
			if [ -z "$DISPLAY" ] && [ $(tty) = /dev/tty1 ]; then
				exec Hyprland
			fi
		'';
		
		sessionVariables = {
			EDITOR="nvim";
			MENU="wofi";
			BROWSER="zen";
		};		

		shellAliases = {
			n = "nvim";
			l = "ls -lha";
		};
	};
}
