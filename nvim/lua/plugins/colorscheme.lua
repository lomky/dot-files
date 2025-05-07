-- gruvbox.lua
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    -- Markdown-specific heading highlights
    vim.api.nvim_set_hl(0, "@markup.heading.1.markdown", { fg = "#fb4934", bg = "", bold = true })
    vim.api.nvim_set_hl(0, "@markup.heading.2.markdown", { fg = "#fabd2f", bg = "", bold = true })
    vim.api.nvim_set_hl(0, "@markup.heading.3.markdown", { fg = "#b8bb26", bg = "", bold = true })
    vim.api.nvim_set_hl(0, "@markup.heading.4.markdown", { fg = "#8ec07c", bg = "", bold = true })
    vim.api.nvim_set_hl(0, "@markup.heading.5.markdown", { fg = "#83a598", bg = "", bold = true })
    vim.api.nvim_set_hl(0, "@markup.heading.6.markdown", { fg = "#d3869b", bg = "", bold = true })

    -- DiffAdd and other Diff groups specifically for Markdown
    -- vim.api.nvim_set_hl(0, 'DiffAdd', { fg = '', bg = '' })
    -- vim.api.nvim_set_hl(0, 'DiffChange', { fg = '', bg = '' })
    -- vim.api.nvim_set_hl(0, 'DiffDelete', { fg = '', bg = '' })
  end,
})

return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
