return {
  { -- Refactoring tool
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" }
    },
    setup = {
      show_success_message = true,
    }
  },
}
