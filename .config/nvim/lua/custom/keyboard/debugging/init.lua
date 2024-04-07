vim.keymap.set({ 'n' }, '<Leader>db', function()
  vim.cmd('DapToggleBreakpoint')
end, { silent = true, desc = '[D]ebugger [B]reakpoint' })

vim.keymap.set({ 'n' }, '<Leader>dr', function()
  vim.cmd('DapContinue')
end, { silent = true, desc = '[D]ebugger [R]un' })

vim.keymap.set({ 'n' }, '<Leader>di', function()
  vim.cmd('DapStepInto')
end, { silent = true, desc = '[D]ebugger Step [I]nto' })

vim.keymap.set({ 'n' }, '<Leader>do', function()
  vim.cmd('DapStepOver')
end, { silent = true, desc = '[D]ebugger Step [O]ver' })

vim.keymap.set({ 'n' }, '<Leader>dx', function()
  vim.cmd('DapTerminate')
  local dapui = require('dapui')
  dapui.close()
end, { silent = true, desc = '[D]ebugger [x]Terminate' })

vim.keymap.set({ 'n' }, '<Leader>de', function()
  local dapui = require('dapui')
  dapui.eval()
end, { silent = true, desc = '[D]ebugger [E]valuate' })
