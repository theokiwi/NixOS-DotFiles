

{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./nvidia.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  networking.networkmanager.enable = true;

  time.timeZone = "America/Sao_Paulo";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

 services.xserver = {
  enable = true;
  displayManager.gdm.enable = true;
  desktopManager.gnome.enable = true;
  displayManager.gdm.wayland = false;
  videoDrivers = ["nvidia"];
  
  xkb = {
    layout = "br";
    variant = "";
  };
};


  console.keyMap = "br-abnt2";

  services.printing.enable = true;

  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;

  };


  users.users.theokiwi = {
    isNormalUser = true;
    description = "Theo Diniz Viana";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    ];
  };

  # Install firefox.
  programs.firefox.enable = true;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
      git
      pciutils
      nautilus
      nautilus-python
      nautilus-open-any-terminal
  ];

  system.stateVersion = "24.11";


environment.sessionVariables = {
  BROWSER = "firefox";
  TERMINAL = "alacritty";
};

#Open Alacritty in Nautilus
programs.nautilus-open-any-terminal = {
  enable = true;
  terminal = "alacritty";
};

 #Flakes

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

 #Stop from sleeping
  systemd.targets.sleep.enable = false;
  systemd.targets.suspend.enable = false;
  systemd.targets.hibernate.enable = false;
  systemd.targets.hybrid-sleep.enable = false;
  
  #Intel Fix -> Allow built-in monitor
  boot.kernelParams = [
    "i915.force_probe=<46a6>"
  ];
    hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      vpl-gpu-rt         
    ];
  };
}
