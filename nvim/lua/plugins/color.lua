function ColorMyGruber(_, opts)
    vim.opt.background = "dark"
    vim.opt.termguicolors = true
    require("gruber-darker").setup(opts)
    vim.cmd.colorscheme("gruber-darker")

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
    "chrisbra/Colorizer",
    { "blazkowolf/gruber-darker.nvim", opts = { bold = false, italic = {
      strings = false, comments = false } },
    name = "gruber-darker", config = ColorMyGruber },
}
