return {
  "folke/trouble.nvim",
  opts = {
    focus = true,
    modes = {
      nsymbols = {
        mode = "symbols",
        win = {
          size = 0.3,
        }
      },
      ndiagnostics = {
        mode = "diagnostics",
        win = {
          position = "bottom",
          size = 0.3,
        },
        preview = {
          type = "split",
          relative = "win",
          position = "right",
          size = 0.5,
        },
      },
    },
  },     -- for default options, refer to the configuration section for custom setup.
  cmd = "Trouble",
  keys = {
    {
      "<leader>fd",
      "<cmd>Trouble ndiagnostics toggle<cr>",
      desc = "Diagnostics (Trouble)",
    },
    -- {
    --   "<leader>xx",
    --   "<cmd>Trouble diagnostics toggle<cr>",
    --   desc = "Diagnostics (Trouble)",
    -- },
    {
      "<leader>xX",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Buffer Diagnostics (Trouble)",
    },
    {
      "<leader>cs",
      "<cmd>Trouble nsymbols toggle focus=false<cr>",
      desc = "Symbols (Trouble)",
    },
    {
      "<leader>cl",
      "<cmd>Trouble lsp toggle focus=false win.position=right win.size=0.3<cr>",
      desc = "LSP Definitions / references / ... (Trouble)",
    },
    {
      "<leader>xL",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "Location List (Trouble)",
    },
    {
      "<leader>fq",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "Quickfix List (Trouble)",
    },
  },
}
