-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 2, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = false,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = false, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
        wrap = true, -- sets vim.opt.wrap
        expandtab = true,
        tabstop = 4,
        softtabstop = 4,
        shiftwidth = 4,
        scrolloff = 15,
        guifont = "FiraCode Nerd Font:h11",
        conceallevel = 2,
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file

        -- typst conceal
        typst_conceal = true,

        -- neovide options
        neovide_transparency = 0.9,
        neovide_hide_mouse_when_typing = true,
        neovide_theme = "dark",
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map
        ["<leader>o"] = false,
        ["<C-a>"] = "ggVG",

        -- navigate buffer tabs with `alt-h` and `alt-l`
        ["<M-l>"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["<M-h>"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
        ["<M-p>"] = ":b#<CR>",

        -- mappings seen under group name "Buffer"
        ["<Leader>bD"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Pick to close",
        },
        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<Leader>b"] = { desc = "Buffers" },
        -- quick save
        -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" }, -- change description but the same command

        U = "<C-r>",
        H = "g^",
        L = "g$",
        J = "5gj",
        K = "5gk",
        ["<M-j>"] = ":m .+1<CR>==",
        ["<M-k>"] = ":m .-2<CR>==",
        ["<M-J>"] = ":t .<CR>",
        ["<M-K>"] = ":t .-1<CR>",
        ["<leader>k"] = { function() vim.lsp.buf.hover() end, desc = "Hover symbol details" },
        ["<leader>j"] = { "J", desc = "Join Lines" },

        ["<leader>r"] = { ":%s//g<Left><Left>", desc = "Global Replace" },
      },
      t = {
        -- setting a mapping to false will disable it
        -- ["<esc>"] = false,
      },
      x = {
        H = "g^",
        L = "g$",
        J = "5gj",
        K = "5gk",
        ["<M-j>"] = ":m'>+<CR>==gv",
        ["<M-k>"] = ":m-2<CR>==gv",
        ["<M-J>"] = ":t'><CR>gv",
        ["<M-K>"] = ":t-1<CR>gv",
        ["<leader>j"] = { "J", desc = "Join Lines" },
        ["<leader>f"] = { 'y<ESC>/<c-r>"<CR>', desc = "Search Selected" },
        ["<leader>F"] = { "<cmd>Telescope grep_string<cr>", desc = "Global Search Selected" },
        ["<leader>R"] = { ":SnipRun<cr>", desc = "SnipRun" },

        ["<leader>r"] = { ":s//g<Left><Left>", desc = "Replace in Selected" },
      },
    },
  },
}
