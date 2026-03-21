return {
	"mfussenegger/nvim-dap",
	dependencies = {
		-- Go debug adapter
		{
			"leoluz/nvim-dap-go",
			opts = {},
		},

		-- Debug UI
		{
			"rcarriga/nvim-dap-ui",
			dependencies = { "nvim-neotest/nvim-nio" },
			opts = {},
		},

		-- Install delve via Mason
		"williamboman/mason.nvim",
		{
			"jay-babu/mason-nvim-dap.nvim",
			opts = {
				ensure_installed = { "delve" },
				automatic_installation = true,
			},
		},
	},
	keys = {
		{ "<F5>", function() require("dap").continue() end, desc = "Debug: Start/Continue" },
		{ "<F10>", function() require("dap").step_over() end, desc = "Debug: Step Over" },
		{ "<F11>", function() require("dap").step_into() end, desc = "Debug: Step Into" },
		{ "<F12>", function() require("dap").step_out() end, desc = "Debug: Step Out" },
		{ "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Debug: Toggle Breakpoint" },
		{ "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, desc = "Debug: Conditional Breakpoint" },
		{ "<leader>dl", function() require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end, desc = "Debug: Log Point" },
		{ "<leader>dr", function() require("dap").repl.open() end, desc = "Debug: Open REPL" },
		{ "<leader>dt", function() require("dap-go").debug_test() end, desc = "Debug: Go Test" },
		{ "<leader>du", function() require("dapui").toggle() end, desc = "Debug: Toggle UI" },
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		-- Auto open/close UI when debugging starts/stops
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end

		-- Breakpoint icons
		-- Breakpoint icons
		vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
		vim.fn.sign_define("DapBreakpointCondition", { text = "◆", texthl = "DapBreakpoint", linehl = "", numhl = "" })
		vim.fn.sign_define("DapStopped", { text = "▶", texthl = "DapStopped", linehl = "DapStopped", numhl = "" })
	end,
}
