-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  -- { import = "astrocommunity.colorscheme.catppuccin" },
  -- { import = "astrocommunity.colorscheme.kanagawa-nvim" },
  {
    "rebelot/kanagawa.nvim",
    opts = {
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = "none",
            },
          },
        },
      },
    },
  },
  { import = "astrocommunity.color.headlines-nvim" },
  { import = "astrocommunity.color.transparent-nvim" },
  {
    "lukas-reineke/headlines.nvim",
    opts = {
      markdown = {
        codeblock_highlight = false,
      },
    },
  },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.python-ruff" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.typst" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.motion.leap-nvim" },
  { import = "astrocommunity.lsp.lsp-signature-nvim" },
  { import = "astrocommunity.editing-support.todo-comments-nvim" },
  { import = "astrocommunity.completion.codeium-vim" },
  -- { import = "astrocommunity.code-runner.sniprun" },
  -- {
  --   "michaelb/sniprun",
  --   build = "bash ./install.sh",
  --   opts = {
  --     display = { "Terminal", "VirtualTextOk" },
  --     selected_interpreters = { "Python3_fifo" },
  --     repl_enable = { "Python3_fifo" },
  --     display_options = {
  --       terminal_scrollback = vim.o.scrollback, -- change terminal display scrollback lines
  --       terminal_line_number = false, -- whether show line number in terminal window
  --       terminal_signcolumn = false, -- whether show signcolumn in terminal window
  --       terminal_position = "horizontal", --# or "horizontal", to open as horizontal split instead of vertical split
  --       terminal_width = 40, --# change the terminal display option width (if vertical)
  --       terminal_height = 15, --# change the terminal display option height (if horizontal)
  --     },
  --   },
  -- },
}
