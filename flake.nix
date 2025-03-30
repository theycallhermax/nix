{
	description = "pleurobema";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
	};

	outputs = { self, nixpkgs, ... }@inputs: {
		nixosConfigurations.supabema = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			modules = [
				./configuration.nix
			];
		};
	};
}

