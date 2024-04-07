vim.keymap.set({ 'n', 'v' }, '<Leader>gqs', function()
  vim.cmd(':Git status')
end, { silent = true, desc = '[G]it [Q]uick [S]tatus' })

vim.keymap.set({ 'n', 'v' }, '<Leader>gs', function()
  vim.cmd(':Git')
end, { silent = true, desc = '[G]it [S]tatus' })

vim.keymap.set({ 'n' }, '<Leader>gtt', function()
  vim.cmd(':Git stash')
end, { silent = true, desc = '[G]it s[T]ash' })

vim.keymap.set({ 'n' }, '<Leader>gtp', function()
  vim.cmd(':Git stash pop')
end, { silent = true, desc = '[G]it s[T]ash [P]op' })

vim.keymap.set({ 'n', 'v' }, '<Leader>gfa', function()
  vim.cmd(':Gwrite')
end, { silent = true, desc = '[G]it [F]ile [A]dd' })
