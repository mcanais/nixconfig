{
	description = "mcanais NixOS configuration";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};

        zen-browser = {
            url = "github:0xc000022070/zen-browser-flake";
            inputs.nixpkgs.follows = "nixpkgs";
        };

		spicetify-nix = {
			url = "github:Gerg-L/spicetify-nix";
            inputs.nixpkgs.follows = "nixpkgs";
        };
	};

	outputs = { nixpkgs, home-manager, ... } @ inputs:
	let
		system = "x86_64-linux";
		pkgs = nixpkgs.legacyPackages.${system};
	in
	{
		nixosConfigurations = {
			thinkpad = nixpkgs.lib.nixosSystem {
				inherit system;

				specialArgs = { inherit inputs; };

				modules = [
					./hosts/thinkpad
				];
			};
		};

		homeConfigurations = {
			mcanais = home-manager.lib.homeManagerConfiguration {
				inherit pkgs;

                extraSpecialArgs = { inherit inputs; };

				modules = [
					./home.nix
				];
			};
		};
	};
}
