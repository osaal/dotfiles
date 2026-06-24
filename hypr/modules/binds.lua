-- Based on ad1822/hyprdots@e7d1663
local vars = require("modules.variables")

-- Concatenate key labels
-- Example: "SUPER SHIFT H" becomes "SUPER + SHIFT + H"
local function keys(first, rest)
    return (first .. " " .. rest):gsub("%s+", " + ")
end

-- Miscellaneous
-- Take screenshot using Grim and Slurp
hl.bind(
    keys(vars.mainMod, "SHIFT s"),
    hl.dsp.exec_cmd("grim -g '$(slurp)' /home/osaal/Pictures/$(date + '%Y-%m-%d_%H:%M:%S.png')")
)
-- Lock screen using Hyprlock
hl.bind(
    keys(vars.mainMod, "l"),
    hl.dsp.exec_cmd("hyprlock --grace 5")
)
-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })

-- Program launchers
hl.bind(
    keys(vars.mainMod, "e"),
    hl.dsp.exec_cmd(vars.terminal .. " bash -ci " .. vars.fileManager)
)

hl.bind(
    keys(vars.mainMod, "t"),
    hl.dsp.exec_cmd(vars.terminal)
)

hl.bind(
    keys(vars.mainMod, "r"),
    hl.dsp.exec_cmd(vars.menu)
)

-- Process management
hl.bind(
    keys(vars.mainMod, "q"),
    hl.dsp.exec_cmd("kill -9 $(hyprctl activewindow j | jq '.pid')")
)

hl.bind(
    keys(vars.mainMod, "m"),
    hl.dsp.exit()
)

-- Window management
hl.bind(
    keys(vars.mainMod, "c"),
    hl.dsp.window.kill()
)

hl.bind(
    keys(vars.mainMod, "v"),
    hl.dsp.window.float({})
)

-- Workspace management
-- Switch workspaces with mainMod + [0-9]
-- Move active window to workspace with mainMo + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(vars.mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i }))
    hl.bind(vars.mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(vars.mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(vars.mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

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
    keys(vars.mainMod, "s"),
    hl.dsp.exec_cmd("/home/osaal/osaal_scripts/hypr_swap_monitors.sh")
)
