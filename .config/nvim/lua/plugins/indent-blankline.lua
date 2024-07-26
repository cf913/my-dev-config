return {
  "lukas-reineke/indent-blankline.nvim",
  enabled = true,
  event = "BufReadPre",
  main = "ibl",
  opts = {
    indent = {
      -- char = "│",
      char = "▏",
      highlight = { "IblIndent" }
    },
    scope = {
      -- highlight = { "NeotestExpandMarker" }
      highlight = { "LineNr4" }
    }
  }
}
