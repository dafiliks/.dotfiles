return {
	{
		"VonHeikemen/lsp-zero.nvim",
		dependencies = {
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "neovim/nvim-lspconfig" },
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
		branch = "v3.x",
		config = function()
			local lsp_zero = require("lsp-zero")

			lsp_zero.on_attach(function(_, bufnr)
				vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, { buffer = bufnr, remap = false })
				vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, { buffer = bufnr, remap = false })
				vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, { buffer = bufnr, remap = false })
				vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, { buffer = bufnr, remap = false })
				vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, { buffer = bufnr, remap = false })
				vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, { buffer = bufnr, remap = false })
				vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, { buffer = bufnr, remap = false })
				vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, { buffer = bufnr, remap = false })
				vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, { buffer = bufnr, remap = false })
				vim.keymap.set("n", "<leader>vmt", function() vim.lsp.buf.format() end, { buffer = bufnr, remap = false })
			end)

			require("mason").setup({})
			require("mason-lspconfig").setup({
				ensure_installed = { "clangd", "pyright" },
				automatic_installation = true,
				handlers = {
					lsp_zero.default_setup,
					clangd = function()
						require("lspconfig").clangd.setup({})
					end,
					pyright = function()
						require("lspconfig").pyright.setup({})
					end,
				},
			})

			local cmp = require("cmp")
			local cmp_select = { behavior = cmp.SelectBehavior.Select }
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				sources = {
					{ name = 'path' },
					{ name = 'nvim_lsp' },
					{ name = 'luasnip', keyword_length = 2 },
					{ name = 'buffer',  keyword_length = 3 },
				},
				formatting = lsp_zero.cmp_format({ details = false }),
				mapping = cmp.mapping.preset.insert({
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-u>"] = cmp.mapping.scroll_docs(-4),
					["<C-d>"] = cmp.mapping.scroll_docs(4),
					["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
					["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
					["<C-y>"] = cmp.mapping.confirm({ select = true }),
					["<CR>"] = nil,
					["<Tab>"] = nil,
					["<S-Tab>"] = nil,
				}),
			})
		end,
	},
}
