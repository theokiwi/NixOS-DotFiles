{ config, pkgs, ... }:

let
  gtkTheme    = pkgs.whitesur-gtk-theme;
  iconTheme   = pkgs.whitesur-icon-theme;
  cursorTheme = pkgs.capitaine-cursors;
  shellTheme  = pkgs.marble-shell-theme;
in
{
  home.packages = [
    gtkTheme
    iconTheme
    cursorTheme
    shellTheme
    pkgs.gnomeExtensions.user-themes
  ];

  gtk = {
    enable = true;
    theme = {
      name = "WhiteSur-Dark";
      package = gtkTheme;
    };
    iconTheme = {
      name = "WhiteSur";
      package = iconTheme;
    };
    cursorTheme = {
      name = "capitaine-cursors";
      package = cursorTheme;
      size = 24;
    };
  };

  dconf.settings = {
    "org/gnome/shell/extensions/user-theme" = {
      name = "WhiteSur-Dark";
    };
    };
}
