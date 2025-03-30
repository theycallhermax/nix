{ config, pkgs, ... }:

{
	
	imports =
    		[
      			./hardware-configuration.nix
    		];

	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	networking.hostName = "supabema";
	networking.networkmanager.enable = true;

	time.timeZone = "America/Toronto";
	i18n.defaultLocale = "en_CA.UTF-8";

	services.xserver.enable = true;
	services.libinput.enable = true;
	services.xserver.displayManager.gdm.enable = true;
	services.xserver.desktopManager.gnome.enable = true;
	services.xserver.xkb = {
		layout = "us";
		variant = "";
  	};
	environment.gnome.excludePackages = with pkgs; [
		# nixos-background-info
		gnome-tour
		geary
	];

	services.printing.enable = true;

	hardware.pulseaudio.enable = false;
	security.rtkit.enable = true;
	services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
  	};

	users.users.max = {
		isNormalUser = true;
		description = "Max Lunaris";
		extraGroups = [ "networkmanager" "wheel" ];
		hashedPassword = "$6$xnOj1Mi.Lc1mQZ2a$xyNrOr4nMGUNT6fPjJPXkHEgV6Atw15dfcq7.Tj6YpFCHF1IJPYFj7shNSdDk9BAkbqLNZoFMapN/7N5Vm4sK/";
		packages = with pkgs; [
			fastfetch
		];
	};

	nixpkgs.config.allowUnfree = true;

	environment.systemPackages = [
		pkgs.gnomeExtensions.blur-my-shell
		pkgs.gnomeExtensions.just-perfection
		pkgs.gnomeExtensions.dash-to-dock
		pkgs.vim
		pkgs.git
	];

	system.stateVersion = "24.11";

}

