-- [[ Basic Keymaps ]]
vim.keymap.set({ 'n', 'v' }, '<Leader>f', function()
  vim.cmd(':Format')
end, { silent = true, desc = '[F]romat' })

-- Buffers and Tabs
vim.keymap.set({ 'n', 'v' }, '<Leader>bn', function()
  vim.cmd.enew()
end, { silent = true, desc = '[B]uffer [N]ew' })

vim.keymap.set({ 'n', 'v' }, '<Leader>bd', function()
  vim.cmd.bd()
end, { silent = true, desc = '[B]uffer [D]elete' })

vim.keymap.set({ 'n', 'v' }, '<Leader>tn', function()
  vim.cmd.tabnew()
end, { silent = true, desc = '[T]ab [N]ew' })

vim.keymap.set({ 'n', 'v' }, '<Leader>td', function()
  vim.cmd.tabclose()
end, { silent = true, desc = '[T]ab [D]elete' })

vim.keymap.set({ 'n', 'v' }, '<Leader>tl', function()
  vim.cmd.tabNext()
end, { silent = true, desc = '[T]ab Next' })

vim.keymap.set({ 'n', 'v' }, '<Leader>th', function()
  vim.cmd.tabprevious()
end, { silent = true, desc = '[T]ab Previous' })


-- Themes
vim.keymap.set({ 'n' }, '<Leader>lk', function()
  vim.cmd.colorscheme('kanagawa')
end, { silent = true, desc = "[L]ive Color [K]anagawa" })

vim.keymap.set({ 'n' }, '<Leader>ld', function()
  vim.cmd.colorscheme('kanagawa-dragon')
end, { silent = true, desc = "[L]ive Color Kanagawa [D]ragon" })

vim.keymap.set({ 'n' }, '<Leader>lo', function()
  vim.cmd.colorscheme('onedark_vivid')
end, { silent = true, desc = "[L]ive Color [O]nedark" })


-- neo-tree
vim.keymap.set({ 'n', 'v' }, ';ns', function()
  vim.cmd(':Neotree show toggle')
end, { silent = true, desc = "[n]eo-tree show" })

vim.keymap.set({ 'n', 'v' }, ';nt', function()
  vim.cmd(':Neotree focus')
end, { silent = true, desc = "Neo-Tree Toggle with focus" })

vim.keymap.set({ 'n', 'v' }, ';nb', function()
  vim.cmd(':Neotree show buffers toggle')
end, { silent = true, desc = "Neo-Tree toggle buffers" })

require('custom.keyboard.fugitive')
require('custom.keyboard.debugging')
require('custom.keyboard.toggleterm')
require('custom.keyboard.cmake')

