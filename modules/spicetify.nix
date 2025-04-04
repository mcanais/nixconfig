{ pkgs, inputs, ... }: 
let
	spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in
{
    imports = [
		inputs.spicetify-nix.homeManagerModules.spicetify 
	];

	home.packages = [
		pkgs.spicetify-cli	
	];

	programs.spicetify = {
		enable = true;
		enabledExtensions = with spicePkgs.extensions; [
			adblockify
			shuffle
		];
		theme = spicePkgs.themes.catppuccin;
		colorScheme = "mocha";
	};
}
