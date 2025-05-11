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
    jq
    bash
    curl
  ];

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
  
  #Conky
  home.file."start_conky.sh".source = ./Resources/start_conky.sh;
  systemd.user.services.start-conky = {
  Unit = {
    Description = "Delayed start for Conky";
    After = [ "graphical-session.target" ];  # assegura que espere o ambiente gráfico
  };
  Service = {
    ExecStart = "${config.home.homeDirectory}/start_conky.sh";
    Restart = "on-failure";
  };
  Install = {
    WantedBy = [ "default.target" ];
  };
};
}


