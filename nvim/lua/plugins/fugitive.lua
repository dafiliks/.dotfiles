return {
	"tpope/vim-fugitive",
	config = function()
		local Group_Fugitive = vim.api.nvim_create_augroup("Group_Fugitive", {})
		local autocmd = vim.api.nvim_create_autocmd

		autocmd("BufWinEnter", {
			group = Group_Fugitive,
			pattern = "*",
			callback = function()
				if vim.bo.ft ~= "fugitive" then
					return
				end

				local bufnr = vim.api.nvim_get_current_buf()
				vim.keymap.set("n", "<leader>p", function()
					vim.cmd.Git("push")
				end, { buffer = bufnr, remap = false })

				vim.keymap.set("n", "<leader>P", function()
					vim.cmd.Git({ "pull", "--rebase" })
				end, { buffer = bufnr, remap = false })

				vim.keymap.set("n", "<leader>t", ":Git push -u origin ", { buffer = bufnr, remap = false })
			end,
		})

		vim.keymap.set("n", "gh", "<cmd>diffget //2<CR>")
		vim.keymap.set("n", "gl", "<cmd>diffget //3<CR>")
	end,
	keys = {
		{ "<leader>gs", function() vim.cmd.Git() end },
	},
}
