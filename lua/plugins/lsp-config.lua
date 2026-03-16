return {
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup()
			opts = {}
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"lua_ls",
				"yamlls",
				"ansiblels",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.lsp.config("lua_ls", {
				root_markers = { ".git", ".luarc.json", ".luarc.jsonc", "lazy-lock.json" },
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						workspace = {
							checkThirdParty = false,
							library = vim.api.nvim_get_runtime_file("", true),
						},
					},
				},
			})
			vim.lsp.enable("lua_ls")

			vim.diagnostic.config({
				virtual_text = true,
				signs = true,
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover)
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action)
		end,
	},
}
