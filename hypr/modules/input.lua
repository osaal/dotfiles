-- Based on ad1822/hyprdots@e7d1663

hl.config({
    input = {
        kb_layout = "fi",
        follow_mouse = 1,
        sensitivity = 0.0,
        touchpad = {
            natural_scroll = false,
        },
    },
})

-- Three-fingered L/R swipe: change workspace
hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace",
})

