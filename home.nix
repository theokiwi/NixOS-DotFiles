{ config, pkgs, ... }:

{

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
  ];


  home.file = {

  };
    programs.alacritty.enable = true;
    home.sessionVariables = {
    BROWSER = "firefox";
    TERMINAL = "alacritty";
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
  
  xdg.enable = true;
}


