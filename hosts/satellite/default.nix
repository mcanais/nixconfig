# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
	imports = [
		./hardware.nix
	];

	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;


	networking = {
		hostName = "nixos";
		networkmanager.enable = true;
		# wireless.enable = true;
	};

	# Configure network proxy if necessary
	# networking.proxy.default = "http://user:password@proxy:port/";
	# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";


	nixpkgs.config.allowUnfree = true;

	nix.settings.experimental-features = ["nix-command" "flakes"];

	# Set your time zone.
	time.timeZone = "Europe/Lisbon";

	# Select internationalisation properties.
	i18n.defaultLocale = "en_US.UTF-8";

	i18n.extraLocaleSettings = {
		LC_ADDRESS = "pt_PT.UTF-8";
		LC_IDENTIFICATION = "pt_PT.UTF-8";
		LC_MEASUREMENT = "pt_PT.UTF-8";
		LC_MONETARY = "pt_PT.UTF-8";
		LC_NAME = "pt_PT.UTF-8";
		LC_NUMERIC = "pt_PT.UTF-8";
		LC_PAPER = "pt_PT.UTF-8";
		LC_TELEPHONE = "pt_PT.UTF-8";
		LC_TIME = "pt_PT.UTF-8";
	};

	fonts.packages = with pkgs; [ 
        nerd-fonts.cousine
	];

	# Enable the X11 windowing system.
	# You can disable this if you're only using the Wayland session.

	# Enable the KDE Plasma Desktop Environment.
	# services.displayManager.sddm.enable = true;
	# services.desktopManager.plasma6.enable = true;

	# Configure keymap in X11
	services.xserver.xkb = {
		layout = "pt";
		variant = "";
	};

	# Configure console keymap
	console.keyMap = "pt-latin1";

	# Enable CUPS to print documents.
	services.printing.enable = true;
	services.pcscd.enable = true;


	security.rtkit.enable = true;



	# Enable sound with pipewire.
	services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
	};

	# Some programs need SUID wrappers, can be configured further or are
	# started in user sessions.
	# programs.mtr.enable = true;
	programs.gnupg.agent = {
		enable = true;
		enableSSHSupport = true;
	};

	# List services that you want to enable:

	# Enable the OpenSSH daemon.
	services.openssh.enable = true;

	services.flatpak.enable = true;
	
	virtualisation.docker.enable = true;

	# Enable bluetooth
	hardware.bluetooth.enable = true;
	hardware.bluetooth.powerOnBoot = true;

	# Enable touchpad support (enabled default in most desktopManager).
	# services.xserver.libinput.enable = true;

	# Define a user account. Don't forget to set a password with ‘passwd’.
	users.users.mcanais = {
		isNormalUser = true;
		description = "Miguel Canais";
		extraGroups = [ "networkmanager" "wheel" "docker" ];
	};

	security.sudo.extraRules = [
		{ 
			users = [ "mcanais" ];
			commands = [ { command = "ALL"; options = [ "NOPASSWD" ]; } ]; 
		}
	];

	# Install firefox.
	programs.firefox.enable = true;
	programs.hyprland.enable = true;


    services.xserver = {
		enable = true;
		autorun = false;

		displayManager.startx.enable = true;

		windowManager.awesome = {
			enable = true;
			luaModules = with pkgs.luaPackages; [
				luarocks
				luadbi-mysql
			];
		};
	};

	hardware.graphics.enable = true;

    xdg.portal = {
        enable = true;
        xdgOpenUsePortal = true;
    };

	# List packages installed in system profile. To search, run:
	# $ nix search wget
	environment.systemPackages = with pkgs; [
		vim 
		wget
		git
		zip
		unzip
		bzip2
		alacritty
		tmux
		gcc
		gdb
		htop
		ripgrep
		gtk4
		man-pages
		docker
		docker-compose
		usbutils
	];


	# Open ports in the firewall.
	# networking.firewall.allowedTCPPorts = [
	# 	7654 
	# 	5432
	# ];
	# networking.firewall.allowedUDPPorts = [ ... ];
	# Or disable the firewall altogether.
	# networking.firewall.enable = false;
	# networking.interfaces.lo = {
	# 	ipv4.addresses = [{ address = "127.0.0.1"; prefixLength = 8; }];
	# };

	# This value determines the NixOS release from which the default
	# settings for stateful data, like file locations and database versions
	# on your system were taken. It‘s perfectly fine and recommended to leave
	# this value at the release version of the first install of this system.
	# Before changing this value read the documentation for this option
	# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
	system.stateVersion = "24.05"; # Did you read the comment?
}
