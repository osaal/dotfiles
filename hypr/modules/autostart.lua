-- Based on ad1822/hyprdots@e7d1663

local vars = require("modules.variables")

local function exec_once(cmd)
    hl.exec_cmd(cmd)
end

hl.on("hyprland.start", function()
    exec_once("swaybg -i /home/osaal/dotfiles/wallpapers/bg_2.jpg -m stretch")
    exec_once("waybar")

    exec_once("dunst &")
    exec_once("systemctl --user start hyprpolkitagent")
end)
