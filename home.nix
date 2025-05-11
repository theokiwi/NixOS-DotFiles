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
    google-fonts
    nerdfonts
    zsh
    zinit
    fzf
    zoxide
    nix-zsh-completions
    zsh-autosuggestions
    neovim
    oh-my-zsh
    curl
    wget
    
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
      
  # Ativa a integração com o XDG Autostart
  xdg.enable = true;
  
  # Cria o arquivo de autostart
  home.file.".config/autostart/conky.desktop".text = ''
  [Desktop Entry]
  Type=Application
  Exec=zsh -c "sleep 5 && bash $HOME/Documents/dotfiles/Resources/Conky/grumicela/start.sh"
  Hidden=false
  NoDisplay=false
  X-GNOME-Autostart-enabled=true
  Name=Conky AutoStart
  Comment=Inicia o Conky automaticamente com a config Celaeno
  '';
  
  #Sourcing external configs
  home.file.".zshrc".source = ./zshrc.conf;
  home.file.".config/alacritty/alacritty.toml".source = ./alacritty.toml;
}
