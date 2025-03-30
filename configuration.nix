{ config, pkgs, ... }:

{
	
	imports =
    		[
      			./hardware-configuration.nix
    		];

	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	networking.hostName = "shitfuck";
	networking.networkmanager.enable = true;

	time.timeZone = "America/Toronto";
	i18n.defaultLocale = "en_CA.UTF-8";

	services.xserver.enable = true;
	services.xserver.libinput.enable = true;
	services.xserver.displayManager.gdm.enable = true;
	services.xserver.desktopManager.gnome.enable = true;
	services.xserver.xkb = {
		layout = "us";
		variant = "";
  	};
	environment.gnome.excludePackages = with pkgs; [
		nixos-background-info
		gnome-tour
		geary
	];
	environment.systemPackages = with pkgs.gnomeExtensions; [
		blur-my-shell
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
		packages = with pkgs; [
    			#  thunderbird
    		];
	};

	nixpkgs.config.allowUnfree = true;

	environment.systemPackages = with pkgs; [
		vim 
	];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
