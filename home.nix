{ config, pkgs, ... }:

{

  home.username = "theokiwi";
  home.homeDirectory = "/home/theokiwi";

  home.stateVersion = "24.11";

  home.packages = [

  ];


  home.file = {

  };


  home.sessionVariables = {
    BROWSER = "firefox";
    TERMINAL = "kitty";
  };

  programs.home-manager.enable = true;

  #GIT
  programs.git = {
    enable = true;
    userName = "theokiwi";
    userEmail = "theodinizv@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
