return
{
  { -- Codeium ai complection
    'Exafunction/codeium.vim',
    event = 'BufEnter'
  },

  { -- uses treesitter to rename / autoclose html tags
    "windwp/nvim-ts-autotag",
  },

  { -- Runs parts of code snipets with output
    'michaelb/sniprun',
    build = './install.sh 1'
  },
  -- "gc" to comment visual regions/lines
  {
    'numToStr/Comment.nvim',
    opts = {}
  },
  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  },
  {
    "mxsdev/nvim-dap-vscode-js",
    dependencies = {
      "microsoft/vscode-js-debug",
      "mfussenegger/nvim-dap"
    }
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter"
    }
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", 'nvim-neotest/nvim-nio' },
    event = "VeryLazy",
    config = function()
      local dap = require('dap')
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        vim.cmd(":Neotree close")
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        vim.cmd(":Neotree close")
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        vim.cmd(":Neotree close")
        dapui.close()
      end
    end
  },
  {
    "williamboman/mason.nvim"
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = { "williamboman/mason.nvim", "mfussenegger/nvim-dap" },
    opts = {
      handlers = {},
    },
  },
  {
    'mfussenegger/nvim-dap',
  },
  {
    'HiPhish/debugpy.nvim',
  },
  {
    'averms/black-nvim',
  },
  {
    'yardnsm/vim-import-cost',
    build = 'npm install --omit=dev'
  },
  -- Vim-surround
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
  {
    "Civitasv/cmake-tools.nvim",
    config = function()
      require("cmake-tools").setup({})
    end
  },
}
