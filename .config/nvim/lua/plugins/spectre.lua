return {
  "nvim-pack/nvim-spectre",
  build = false,
  cmd = "Spectre",
  opts = { open_cmd = "noswapfile vnew" },
  -- stylua: ignore
  keys = {
    { "<leader>sr", function() require("spectre").toggle() end,                                 desc = "Replace in Files (Spectre)" },
    { "<leader>sw", function() require("spectre").open_visual({ select_word = true }) end,      desc = "Replace Selected Word (Spectre)" },
    { "<leader>sf", function() require("spectre").open_file_search({ select_word = true }) end, desc = "Replace in Current File (Spectre)" },
  },
}
