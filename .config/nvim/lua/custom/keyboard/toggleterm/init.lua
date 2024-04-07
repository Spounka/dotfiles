vim.keymap.set({ 'n', 'v' }, '<Leader>tt', function()
  vim.cmd(':ToggleTerm')
end, { silent = true, desc = '[T]erm [T]oggle' })

vim.keymap.set({ 'n', 'v' }, '<Leader>tf', function()
  vim.cmd(':ToggleTerm direction=float')
end, { silent = true, desc = '[T]erm [F]loat' })


vim.keymap.set({ 'n', 'v' }, '<Leader>t1', function()
  vim.cmd(':ToggleTerm 1')
end, { silent = true, desc = '[T]erm [T]oggle 1' })


vim.keymap.set({ 'n', 'v' }, '<Leader>t2', function()
  vim.cmd(':ToggleTerm 2')
end, { silent = true, desc = '[T]erm [T]oggle 2' })

vim.keymap.set({ 'n', 'v' }, '<Leader>t3', function()
  vim.cmd(':ToggleTerm 3')
end, { silent = true, desc = '[T]erm [T]oggle 3' })

vim.keymap.set({ 'n', 'v' }, '<Leader>t4', function()
  vim.cmd(':ToggleTerm 4')
end, { silent = true, desc = '[T]erm [T]oggle 4' })

vim.keymap.set({ 'n', 'v' }, '<Leader>t5', function()
  vim.cmd(':ToggleTerm 5')
end, { silent = true, desc = '[T]erm [T]oggle 5' })


-- Floating terminals
vim.keymap.set({ 'n', 'v' }, '<Leader>tf2', function()
  vim.cmd(':ToggleTerm direction=float 2')
end, { silent = true, desc = '[T]erm [T]oggle 2' })

vim.keymap.set({ 'n', 'v' }, '<Leader>tf3', function()
  vim.cmd(':ToggleTerm direction=float 3')
end, { silent = true, desc = '[T]erm [T]oggle 3' })

vim.keymap.set({ 'n', 'v' }, '<Leader>tf4', function()
  vim.cmd(':ToggleTerm direction=float 4')
end, { silent = true, desc = '[T]erm [T]oggle 4' })

vim.keymap.set({ 'n', 'v' }, '<Leader>tf5', function()
  vim.cmd(':ToggleTerm direction=float 5')
end, { silent = true, desc = '[T]erm [T]oggle 5' })


function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  -- vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  -- vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  -- vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  -- vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  -- vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
