{ config, pkgs, ... }:

{

	home.username = "max";
	home.homeDirectory = "/home/max";

	home.packages = [
		pkgs.fastfetch
		pkgs.woeusb-ng
		# inputs.zen-browser.packages.${pkgs.system}.default
	];

	dconf = {
		enable = true;
		settings."org/gnome/shell" = {
			disable-user-extensions = false;
			enabled-extensions = with pkgs.gnomeExtensions; [
				blur-my-shell.extensionUuid
				just-perfection.extensionUuid
				dash-to-dock.extensionUuid
			];
		};
		settings."org/gnome/desktop/interface" = {
			font-name = "Inter 11";
			document-font-name= "Inter 11";
			monospace-font-name = "Cascadia Code 11";
			enable-hot-corners = false;
			clock-format = "12h";
		};
		settings."org/gnome/desktop/peripherals/touchpad" = {
			natural-scroll = false;
		};
		settings."org/gnome/shell/extensions/just-perfection" = {
			clock-menu-position = 1;
			startup-status = 1;
			workspaces-in-app-grid = false;
			panel-size = 40;
		};
	};

	programs.git = {
		enable = true;
		userName = "theycallhermax";
		userEmail = "mdwalters.pm@proton.me";
		extraConfig = {
			init.defaultBranch = "main";
		};
	};

	home.stateVersion = "24.11";
	programs.home-manager.enable = true;

}
