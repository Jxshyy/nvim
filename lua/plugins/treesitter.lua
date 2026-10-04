---@diagnostic disable: missing-fields

-- install treesitter
local ensure_installed = { "yaml", "python", "lua", "markdown", "nix" }

return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		-- The main branch ships its query files (indents/highlights/etc.) under
		-- a "runtime/" subdir that isn't on rtp by default, so
		-- vim.treesitter.query.get() can't find them for any language except
		-- lua (which nvim bundles itself). Add it explicitly.
		local config_file = vim.api.nvim_get_runtime_file("lua/nvim-treesitter/config.lua", false)[1]
		if config_file then
			local plugin_root = vim.fn.fnamemodify(config_file, ":h:h:h")
			vim.opt.rtp:append(plugin_root .. "/runtime")
		end

		require("nvim-treesitter").setup()
		require("nvim-treesitter").install(ensure_installed)

		vim.api.nvim_create_autocmd("FileType", {
			callback = function()
				pcall(vim.treesitter.start)
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
	end,
}
