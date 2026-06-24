-- Based on ad1822/hyprdots@e7d1663

hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 20,
        border_size = 4,
        col = {
            active_border = "rgba(99,9,9,1.0)",
            inactive_border = "rgba(595959aa)",
        },
        resize_on_border = true,
        allow_tearing = false,
        layout = "dwindle",
    },

    dwindle = {
        preserve_split = true,
    },

    master = {
        new_status = "master",
    }
})
