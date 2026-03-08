{ config, pkgs, ... }:
{
    ### Initial configuration ###
    nixpkgs.config.allowUnfree = true;
    programs.firefox.enable = true;
    programs.hyprland.enable = true;

    ### User packages ###
    users.users.osaal.packages = with pkgs; [
        discord
        btop
        obsidian
        bolt-launcher
        yazi    # File explorer TUI. Dep: fd, ripgrep, fzf, zoxide
        fd      # File searching
        fzf     # File subtree navigation
        ripgrep # File content searching
        zoxide  # Historical directories navigation
    ];

    ### System packages ###
    environment.systemPackages = with pkgs; [
        neovim
        wget
        git
        rustup
        zig
        kitty               # Terminal
        rofi                # App launcher
        waybar              # Status bar
        dunst               # Notification daemon
        hyprpolkitagent     # Authentication handler
        kdePackages.sddm    # Login manager
        hyprcursor          # Cursors
        rose-pine-hyprcursor# One particular cursor
        jq                  # JSON processor. Revdep: hypr_swap_monitors.sh
        pavucontrol         # PulseAudio Volume Control for Waybar widget
        file                # File information
        swaybg              # Wallpaper engine
        slurp               # Region selector
        grim                # Image capturing
    ];

    ### Fonts ###
    fonts.packages = with pkgs; [
        font-awesome_4
        nerd-fonts.fira-mono
    ];

    ### Specific package setups ###
    programs.bash = {
        enable = true;
        shellAliases = {
            hyvi="nvim /home/osaal/.config/hypr/hyprland.conf";
            nivi="sudo nvim /etc/nixos/configuration.nix";
            switch="sudo nixos-rebuild switch";
        };
    };
    programs.git = {
        enable = true;
        config = {
            init = { defaultBranch = "main"; };
            gpg.format = "ssh";
        };
    };
}
