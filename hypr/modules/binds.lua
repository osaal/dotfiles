-- Based on ad1822/hyprdots@e7d1663
local vars = require("module.variables")

-- Concatenate key labels
-- Example: "SUPER SHIFT H" becomes "SUPER + SHIFT + H"
local function keys(first, rest)
    return (first .. " " .. rest):gsub("%s+", " + ")
end

-- Miscellaneous
-- Take screenshot using Grim and Slurp
hl.bind(
    keys(vars.mainMod, "SHIFT S"),
    hl.dsp.exec_cmd("grim -g '$(slurp)' /home/osaal/Pictures/$(date + '%Y-%m-%d_%H:%M:%S.png')")
)

-- Lock screen using Hyprlock
hl.bind(
    keys(vars.mainMod, "L"),
    hl.dsp.exec_cmd("hyprlock --grace 5")
)

-- Program launchers
hl.bind(
    keys(vars.mainMod, "E"),
    hl.dsp.exec_cmd(vars.terminal .. " bash -ci " .. vars.fileManager),
)

hl.bind(
    keys(vars.mainMod, "T"),
    hl.dsp.exec_cmd(vars.terminal),
)

hl.bind(
    keys(vars.mainMod, "R"),
    hl.dsp.exec_cmd(vars.menu)
)

-- Process management
hl.bind(
    keys(vars.mainMod, "Q"),
    hl.dsp.exec_cmd("kill -9 $(hyprctl activewindow j | jq '.pid')"),
)

-- Window management
hl.bind(
    keys(vars.mainMod, "C"),
    hl.dsp.window.kill(),
)

hl.bind(
    keys(vars.mainMod, "V"),
    hl.dsp.window.float(),
)

hl.bind(
    keys(vars.mainMod, "P"),
    hl.dsp.window.pseudo(),
)

-- START: Workspace management
-- Move focus to window in direction
local window_directions = {
    left = "l",
    right = "r",
    up = "u",
    down = "d",
}

local function add_focus_direction(k, v)
    hl.bind(
        keys(vars.mainMod, k),
        hl.dsp.workspace.focus({ direction = l }),
    )
end

for k, v in pairs(window_directions) do
    add_focus_direction(k, v)
end

-- END: Workspace management

-- Monitor management
hl.bind(
    keys(vars.mainMod, "SHIFT left"),
    hl.dsp.exec_cmd("movecurrentworkspacetomonitor l")
)

hl.bind(
    keys(vars.mainMod, "SHIFT right"),
    hl.dsp.exec_cmd("movecurrentworkspacetomonitor r")
)

hl.bind(
    keys(vars.mainMod, "S"),
    hl.dsp.exec_cmd("/home/osaal/osaal_scripts/hypr_swap_monitors.sh")
)
