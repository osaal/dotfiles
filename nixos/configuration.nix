{ config, pkgs, ... }:

{
  imports =
    [ 
      /etc/nixos/hardware-configuration.nix
      ./software.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  networking.hostName = "osaal"; 
  networking.networkmanager.enable = true;

  fileSystems."/mnt/secondary" = {
    device = "/dev/disk/by-uuid/712d3b76-40ea-4f82-a3e8-ef4672778842";
    fsType = "ext4";
    options = [
      "user" # Users can mount
      "nofail" # Skipped if failed
      "auto" # Mount on boot
      "rw" # Read-write access
      "exec" # Executable
      "suid" # SetUID/GetUID (?)
    ];
  };

  time.timeZone = "Europe/Helsinki";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fi_FI.UTF-8";
    LC_IDENTIFICATION = "fi_FI.UTF-8";
    LC_MEASUREMENT = "fi_FI.UTF-8";
    LC_MONETARY = "fi_FI.UTF-8";
    LC_NAME = "fi_FI.UTF-8";
    LC_NUMERIC = "fi_FI.UTF-8";
    LC_PAPER = "fi_FI.UTF-8";
    LC_TELEPHONE = "fi_FI.UTF-8";
    LC_TIME = "fi_FI.UTF-8";
  };

  services.xserver.xkb = {
    layout = "fi";
    variant = "";
  };
  console.keyMap = "fi";

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  hardware.bluetooth = {
	enable = true;
	powerOnBoot = true;
	settings = {
		General = { Experimental = true; FastConnectable = true; };
		Policy = { AutoEnable = true; };
	};
  };

  services.blueman.enable = true;

  users.users.osaal = {
    isNormalUser = true;
    description = "Oliver Saal";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # Ensure that SDDM is not hanging on reading fingerprints
  security.pam.services.login.fprintAuth = false;
  services.displayManager = {
    sddm = {
      enable = true;
      wayland.enable = true;
    };
    autoLogin = {
      enable = true;
      user = "osaal";
    };
  };

  system.stateVersion = "25.11"; 
}
