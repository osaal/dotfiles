-- Based on ad1822/hyprdots@e7d1663

hl.config({
    decoration = {
        dim_special = 0.2,
        rounding = 0,
        rounding_power = 2,
        active_opacity = 1.0,
        inactive_opacity = 1.0,
        shadow = {
            enabled = true,
            range = 300,
            render_power = 3,
            color = "rgba(1a1a1aaf)",
            offset = "10 10",
        },
        blur = {
            enabled = true,
            size = 5,
            popups = true,
            passes = 4,
            vibrancy = 0.4,
            new_optimizations = true,
            ignore_opacity = true,
            special = true,
        },
    },
})
