return {
	-- Render markdown inline inside Neovim (no browser needed)
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		ft = { "markdown" },
		keys = {
			{ "<leader>mp", "<cmd>RenderMarkdown toggle<CR>", ft = "markdown", desc = "Markdown Preview Toggle" },
		},
		opts = {},
	},

	-- Browser-based preview (when you need full HTML rendering)
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreview", "MarkdownPreviewStop" },
		keys = {
			{ "<leader>mb", "<cmd>MarkdownPreview<CR>", ft = "markdown", desc = "Markdown Preview (Browser)" },
			{ "<leader>ms", "<cmd>MarkdownPreviewStop<CR>", ft = "markdown", desc = "Markdown Preview Stop" },
		},
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
		config = function()
			vim.g.mkdp_auto_start = 0
			vim.g.mkdp_auto_close = 1
			vim.g.mkdp_refresh_slow = 0
			vim.g.mkdp_browser = ""
			vim.g.mkdp_echo_preview_url = 1
			vim.g.mkdp_preview_options = {
				maid = {},
			}
		end,
	},
}
