return {
	"Wansmer/treesj",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	vscode = true,
	keys = {
		{
			"<leader>cs",
			"<cmd>TSJToggle<cr>",
			desc = "Split/Join",
		},
	},
	opts = {
		use_default_keymaps = false,
		cursor_behavior = "hold",
		notify = true,
		dot_repeat = true,
		on_error = nil,
		check_syntax_error = true,
		max_join_length = 1200,
	},
}
