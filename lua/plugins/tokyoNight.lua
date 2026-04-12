return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      style = "night", -- Options: "storm", "moon", "night", "day"
      transparent = false, -- Set to true for transparent background
      styles = {
        sidebars = "dark",
        floats = "dark",
      }
    })

    vim.cmd.colorscheme "tokyonight"
  end
}
