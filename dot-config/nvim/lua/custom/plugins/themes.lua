return {
  {
    "rebelot/kanagawa.nvim",
    priority = 999,
    config = function()
      vim.cmd.colorscheme 'kanagawa'
    end,

  },
  { -- Theme inspired by Atom
    'olimorris/onedarkpro.nvim',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'onedark_vivid'
    end,
  },

  { -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = true,
        theme = 'kanagawa',
        component_separators = '|',
        section_separators = '',
      },
    },
  },
  {
    'rmehri01/onenord.nvim',
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 998,
    opts = {},
    config = function()
      vim.cmd.colorscheme 'tokyonight-night'
    end,
  },
  {
    'tanvirtin/monokai.nvim',
    priority = 997,
    config = function()
      vim.cmd.colorscheme 'monokai'
    end,
  }
}
