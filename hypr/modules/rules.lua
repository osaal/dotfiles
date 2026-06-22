-- Based on ad1822/hyprdots@e7d1663

-- Suppresses maximize requests from apps.
hl.window_rule({
    name = "no_maximise",
    match = {
        class = ".*"
    },
    suppress_event = "maximize",
})

-- Fixes Xwayland dragging issues (as the tin says...)
hl.window_rule({
    name = "fix_xwayland_dragging",
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = true,
    },
    no_initial_focus = true,
})

hl.workspace_rule({
    workspace = "1",
    monitor = "eDP-1",
})

hl.workspace_rule({
    workspace = "2",
    monitor = "DP-1",
})
