vim.keymap.set({ 'n', 'v' }, '<Leader>cg', function()
  vim.cmd('CMakeGenerate')
end, { silent = true, desc = '[C]make [G]enerate' })

vim.keymap.set({ 'n', 'v' }, '<Leader>cb', function()
  vim.cmd('CMakeBuild')
end, { silent = true, desc = '[C]make [B]build' })

vim.keymap.set({ 'n', 'v' }, '<Leader>cr', function()
  vim.cmd('CMakeRun')
end, { silent = true, desc = '[C]make [R]un' })
