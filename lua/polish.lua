-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- neovide configs
if vim.g.neovide then
  vim.cmd "TransparentDisable"
  vim.keymap.set("v", "<C-S-C>", '"+y') -- Copy
  vim.keymap.set("n", "<C-S-V>", '"+p') -- Paste normal mode
  vim.keymap.set("v", "<C-S-V>", '"+p') -- Paste visual mode
  vim.keymap.set("c", "<C-S-V>", "<C-R>+") -- Paste command mode
  vim.keymap.set("i", "<C-S-V>", '<ESC>"+pi') -- Paste insert mode
else
  vim.cmd "TransparentEnable"
end

-- Set up custom filetypes
-- vim.filetype.add {
--   extension = {
--     foo = "fooscript",
--   },
--   filename = {
--     ["Foofile"] = "fooscript",
--   },
--   pattern = {
--     ["~/%.config/foo/.*"] = "fooscript",
--   },
-- }
