return {
    {
        "nvim-treesitter/nvim-treesitter",
        version = false,
        build = ":TSUpdate",
        opts = {
            ensure_installed = { "lua" },
            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = { "markdown" },
            },
            indent = { enable = true },
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
    "nvim-treesitter/playground",
    {
        "nvim-treesitter/nvim-treesitter-context",
        enabled = true,
        opts = { enable = true, mode = "cursor", max_lines = 3, trim_scope = "inner" },
        keys = {
            {
                "<leader>ut",
                function() require("treesitter-context").toggle() end,
                desc = "Toggle Treesitter Context",
            },
        },
    }
}
