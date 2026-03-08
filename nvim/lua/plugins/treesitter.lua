-- source: https://www.tonybtw.com/tutorial/neovim/
return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            highlight = { enable = true },
            indent = { enable = true },
            ensure_installed = {
                "c",
                "lua",
                "vim",
                "vimdoc",
                "markdown",
                "markdown_inline",
                "rust",
                "nix",
            },
            auto_install = false,
        })
    end,
}
