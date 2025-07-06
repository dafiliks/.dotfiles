return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "jcha0713/cmp-tw2css",
        { "williamboman/mason.nvim" },
        { "williamboman/mason-lspconfig.nvim" },
    },
    config = function()
        vim.diagnostic.config({
            float = { border = "rounded" },
        })

        require("mason").setup()
        require("mason-lspconfig").setup({
            automatic_installation = false,
        })

        local cmp = require("cmp")
        cmp.setup({
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-n>'] = cmp.mapping.select_next_item(),
                ['<C-p>'] = cmp.mapping.select_prev_item(),
                ['<CR>']  = cmp.mapping.confirm({ select = true }),
                ['<C-e>'] = cmp.mapping.abort(),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "cmp-tw2css" },
                { name = "buffer" },
                { name = "path" },
                { name = "cmdline" },
            }),
            window = {
                completion = { border = "rounded" },
                documentation = { border = "rounded" },
            },
        })

        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(event)
                local opts = { buffer = event.buf }
                local map = vim.keymap.set
                local lsp = vim.lsp.buf
                local diag = vim.diagnostic

                map("n", "gd", lsp.definition, opts)
                map("n", "K", lsp.hover, opts)
                map("n", "<leader>lf", lsp.format, opts)
                map("n", "<leader>la", lsp.code_action, opts)
                map("n", "<leader>lr", lsp.rename, opts)
                map("n", "<leader>k", diag.open_float, opts)
                map("n", "<leader>ln", diag.goto_next, opts)
                map("n", "<leader>lp", diag.goto_prev, opts)
            end,
        })
    end,
}
