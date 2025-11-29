return {
	"mfussenegger/nvim-dap",
	dependencies = {
		{
			"rcarriga/nvim-dap-ui",
			keys = {
				{ "<leader>du", function() require("dapui").toggle({}) end },
				{ "<leader>de", function() require("dapui").eval() end, mode = { "n", "v" } },
			},
			opts = {},
			config = function(_, opts)
				local dap = require("dap")
				local dapui = require("dapui")
				dapui.setup(opts)
				dap.listeners.after.event_initialized["dapui_config"] = function()
					dapui.open({})
				end
				dap.listeners.before.event_terminated["dapui_config"] = function()
					dapui.close({})
				end
				dap.listeners.before.event_exited["dapui_config"] = function()
					dapui.close({})
				end
			end,
		},
		{
			"theHamsta/nvim-dap-virtual-text",
			opts = {},
		},
		{
			"jay-babu/mason-nvim-dap.nvim",
			dependencies = "mason.nvim",
			cmd = { "DapInstall", "DapUninstall" },
			opts = {
				automatic_installation = true,
				handlers = {},
				ensure_installed = {},
			},
		},
	},
	keys = {
		{ "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end },
		{ "<leader>db", function() require("dap").toggle_breakpoint() end },
		{ "<leader>dc", function() require("dap").continue() end },
		{ "<leader>da", function() require("dap").continue({ before = get_args }) end },
		{ "<leader>dC", function() require("dap").run_to_cursor() end },
		{ "<leader>dg", function() require("dap").goto_() end },
		{ "<leader>di", function() require("dap").step_into() end },
		{ "<leader>dj", function() require("dap").down() end },
		{ "<leader>dk", function() require("dap").up() end },
		{ "<leader>dl", function() require("dap").run_last() end },
		{ "<leader>do", function() require("dap").step_out() end },
		{ "<leader>dO", function() require("dap").step_over() end },
		{ "<leader>dp", function() require("dap").pause() end },
		{ "<leader>dr", function() require("dap").repl.toggle() end },
		{ "<leader>ds", function() require("dap").session() end },
		{ "<leader>dt", function() require("dap").terminate() end },
		{ "<leader>dw", function() require("dap.ui.widgets").hover() end },
	},
	config = function()
		vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })
	end,
}
