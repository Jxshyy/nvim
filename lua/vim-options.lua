vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.opt.termguicolors = true
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.wo.relativenumber = true

-- Neovim's default wl-clipboard provider caches reads/writes per-session,
-- so a yank in one instance can appear stale when pasted in another. Disable
-- the cache so "+y / "+p always round-trip through wl-copy/wl-paste live.
vim.g.clipboard = {
  name = "wl-clipboard (no cache)",
  copy = {
    ["+"] = "wl-copy",
    ["*"] = { "wl-copy", "--primary" },
  },
  paste = {
    ["+"] = "wl-paste --no-newline",
    ["*"] = { "wl-paste", "--no-newline", "--primary" },
  },
  cache_enabled = false,
}

-- recognise terraform files, set filetypes
vim.cmd([[silent! autocmd! filetypedetect BufRead,BufNewFile *.tf]])
vim.cmd([[autocmd BufRead,BufNewFile *.hcl set filetype=hcl]])
vim.cmd([[autocmd BufRead,BufNewFile .terraformrc,terraform.rc set filetype=hcl]])
vim.cmd([[autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform]])
vim.cmd([[autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json]])

vim.api.nvim_set_option("clipboard", "unnamedplus")
