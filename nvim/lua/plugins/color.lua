function ColorMyRosePine(_, opts)
    vim.opt.background = "dark"
    vim.opt.termguicolors = true
    require("rose-pine").setup(opts)
    vim.cmd.colorscheme("rose-pine")

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
    "chrisbra/Colorizer",
    { "rose-pine/neovim", opts = { bold = false, italic = {
        strings = false, comments = false } },
    name = "rose-pine", config = ColorMyRosePine },
}
