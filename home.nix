{ config, pkgs, ... }:

{

    home.username = "max";
    home.homeDirectory = "/home/max";

    home.packages = with pkgs; [
        fastfetch
        inputs.zen-browser.packages.${system}.default
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
    };

    programs.git = {
        enable = true;
        userName = "theycallhermax";
        userEmail = "mdwalters.pm@proton.me";
    };

    home.stateVersion = "24.11";
    programs.home-manager.enable = true;

}
