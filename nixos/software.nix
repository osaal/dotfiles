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
        zotero
        yazi    # File explorer TUI. Dep: fd, ripgrep, fzf, zoxide
        fd      # File searching
        fzf     # File subtree navigation
        ripgrep # File content searching
        zoxide  # Historical directories navigation
        tree    # Directory tree listing
        p7zip   # 7zip Unix fork
        subversion  # SVN source management (mainly for R source code)
    ];

    ### System packages ###
    environment.systemPackages = with pkgs; [
        neovim
        wget
        git
        zig
        clang
        devenv              # For software development environments
        direnv              # Automatically enable devenvs in folders
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
        vscode              # Code editing (while I try to get nvim functional...)
        asusctl             # Utilities for ASUS ROG laptops
        hyprlock            # Lock screen
        imv                 # Image viewer
        dragon-drop         # Drag-and-drop through a CLI
        sqlite              # SQLite... duh.
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
            push.autoSetupRemote = true;
        };
    };
    # TODO: Switch to `brightnessctl` or `acpilight` by nixpkgs:26.05 - `light` is being removed.
    programs.light = {
        enable = true;
        brightnessKeys = {
            enable = true;
        };
    };
}
