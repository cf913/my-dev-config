return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    preset = "modern",
    expand = 1,
    triggers = {
      { "g",        mode = { "n", "v" } },
      { "c",        mode = { "n", "v" } },
      { "d",        mode = { "n", "v" } },
      { "<leader>", mode = { "n", "v" } },
      { "<C-w>",    mode = { "n", "v" } },
    }
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  }
}
