-- Based on ad1822/hyprdots@e7d1663
local vars = require("modules.variables")
local mod = "SUPER"
local mods = "SUPER + SHIFT"
local moda = "SUPER + ALT"
local modc = "SUPER + CTRL"
local modcs = "SUPER + CTRL + SHIFT"
local altsh = "ALT + SHIFT"
local ctrla = "CTRL + ALT"

-- Concatenate key labels
-- Example: "SUPER SHIFT H" becomes "SUPER + SHIFT + H"
local function keys(first, rest)
    return (first .. " " .. rest):gsub("%s+", " + ")
end

-- Bind key to command
local function bind(modifier, key, cmd)
    hl.bind(modifier .. " + " .. key, hl.dsp.exec_cmd(cmd))
end

-- Bind key to dispatcher function
local function bindDsp(modifier, key, dispatcher)
	hl.bind(modifier .. " + " .. key, dispatcher)
end

-- ── Apps ─────────────────────────────────────────────────────────
bind(mod, "E", vars.terminal .. " -e " .. vars.fileManager)
bind(ctrla, "DELETE", vars.terminal .. " -e " .. vars.taskManager)
bind(mod, "T", vars.terminal)
bind(mod, "O", vars.note)
bind(mod, "R", vars.menu)
bind(mod, "N", vars.quickText)

-- ── Waybar ───────────────────────────────────────────────────────
bind(altsh, "W", "pkill -9 waybar || waybar &")

-- ── Screenshots ──────────────────────────────────────────────────
bind(
    mods,
    "S",
    'sh -c \'FILE=$HOME/Pictures/Screenshots/$(date +%Y-%m-%d_%H-%M-%S).png && grim -g "$(slurp)" "$FILE" && notify-send "Screenshot Saved" -i "$FILE"\''
)
-- ── Lockscreen ───────────────────────────────────────────────────
-- TODO: Find a new keybind for screen locking, conflicts with Vim movement
bind(mod, "L", "hyprlock --grace 5")

-- ── Multimedia and Brightness ────────────────────────────────────
hl.bind("XF86AudioLowerVolume",         -- Dedicated key 1
    hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    { locked = true, repeating = true })
hl.bind("XF86AudioRaiseVolume",         -- Dedicated key 2
    hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",             -- Dedicated key 3
    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMute",                -- Fn + F1
    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",        -- Fn + F7
    hl.dsp.exec_cmd("sh -c 'brightnessctl set 2%- && ~/.local/bin/brightness.sh'"))
hl.bind("XF86MonBrightnessUp",          -- Fn + F8
    hl.dsp.exec_cmd("sh -c 'brightnessctl set +2% && ~/.local/bin/brightness.sh'"))

-- ── Window Controls ──────────────────────────────────────────────
bindDsp(mod, "W", hl.dsp.window.close())
bindDsp(mod, "G", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
bindDsp(mod, "V", hl.dsp.window.float({ action = "toggle" }))
bindDsp(mod, "M", hl.dsp.exit())
bindDsp("ALT", "Tab", hl.dsp.window.cycle_next())
-- TODO: Find a new keybind for screen locking
bindDsp(mod, "H", hl.dsp.focus({ direction = "l" }))
bindDsp(mod, "L", hl.dsp.focus({ direction = "r" }))
bindDsp(mod, "K", hl.dsp.focus({ direction = "u" }))
bindDsp(mod, "J", hl.dsp.focus({ direction = "d" }))

-- ── Workspaces ───────────────────────────────────────────────────
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(vars.mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i }))
    hl.bind(vars.mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(vars.mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(vars.mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Monitor management
-- TODO: fix these, with something like below:
-- local MONITOR = $(hyprctl activemonitor -j | jq '.monitor')
-- local CMD = hl.dsp.workspace.move({ monitor = MONITOR})
-- bind(mods, "left", CMD)
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
