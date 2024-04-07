return {
  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',
  {
    's1n7ax/nvim-window-picker',
    name = 'window-picker',
    event = 'VeryLazy',
    version = '2.*',
    config = function()
      require 'window-picker'.setup()
    end,

  },
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = true,
    opts = {
      autochdir = true,
      direction = "horizontal",
      dir = "git_dir,"
    }
  },
}
