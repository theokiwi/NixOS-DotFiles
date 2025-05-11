{ config, pkgs, ... }:

let
  conkyGrumicela = ./Resources/Conky/grumicela;
in
{
  imports = [
    ./themes.nix
  ];

  home.username = "theokiwi";
  home.homeDirectory = "/home/theokiwi";
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    discord
    chromium
    logisim
    neovim
    gitkraken
    vscode
    gtkwave
    alacritty
    alacritty-theme
    conky
  ];

  home.file = {
    ".config/conky/grumicela".source = conkyGrumicela;

    ".config/autostart/conky.desktop".text = ''
      [Desktop Entry]
      Type=Application
      Name=Conky-Grumicela
      Exec=conky -c $HOME/.config/conky/grumicela/grumicela.conf
      X-GNOME-Autostart-enabled=true
    '';
  };

  programs.alacritty.enable = true;

  home.sessionVariables = {
    BROWSER = "firefox";
    TERMINAL = "alacritty";
  };

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "theokiwi";
    userEmail = "theodinizv@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  xdg.enable = true;
}
