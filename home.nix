{ config, pkgs, inputs, ... }:

{
	home.username = "mcanais";
	home.homeDirectory = "/home/mcanais";

	imports = [
		./modules/bash.nix
		./modules/git.nix
		./modules/alacritty.nix
		./modules/hyprland.nix
        ./modules/zen.nix
	];

	home.stateVersion = "24.05";
	

	nixpkgs.config.allowUnfree = true;
	

	home.packages = with pkgs; [
		hyprpaper

		wl-clipboard
		grim
		slurp

		neovim
		helix
		vscodium
		yazi

		python312
		rustup
		ghc

		brightnessctl

		fzf
		tealdeer
		tree
		bat
		bluez
		lazygit
		neofetch

		spotify
		kdePackages.okular
		feh
		obsidian
		openvpn
		libreoffice
		libqalculate
	];

	gtk.enable = true;
	gtk.cursorTheme.package = pkgs.bibata-cursors;
	gtk.cursorTheme.name = "Bibata-Modern-Ice";
	gtk.cursorTheme.size = 20;

	home.file = {
		".icons/bibata".source = "${pkgs.bibata-cursors}/share/icons/Bibata-Modern-Classic";
	};
	
	qt.enable = true;

	# Let Home Manager install and manage itself
	programs.home-manager.enable = true;
}
