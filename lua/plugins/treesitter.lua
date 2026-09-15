---@diagnostic disable: missing-fields

-- install treesitter
return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = { "yaml", "python", "lua", "markdown", "nix"},
			auto_install = true,
			sync_install = false,
			ignore_install = {},
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
