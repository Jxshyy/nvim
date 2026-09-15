return {
	{
		-- Mason only for LSPs not available in nixpkgs (e.g. ansiblels)
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"ansiblels",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- lua_ls (installed via nix: lua-language-server)
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

			-- nil_ls: Nix LSP (installed via nix: nil)
			vim.lsp.config("nil_ls", {
				root_markers = { "flake.nix", ".git" },
				settings = {
					["nil"] = {
						formatting = { command = { "nixpkgs-fmt" } },
					},
				},
			})
			vim.lsp.enable("nil_ls")

			-- yamlls (installed via nix: yaml-language-server)
			vim.lsp.enable("yamlls")

			vim.diagnostic.config({
				virtual_text = true,
				signs = true,
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover)
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action)
		end,
	},
}
