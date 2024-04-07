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
  }
}
