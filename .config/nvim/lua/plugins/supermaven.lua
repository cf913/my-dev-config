return {
  "supermaven-inc/supermaven-nvim",
  keys = {
    {
      "<leader>TS",
      desc = 'Start Supermaven',
      accept_suggestion = "<Tab>",
      clear_suggestion = "<C-]>"
    },
  },
  opts = {
    color = {
      suggestion_color = "#00ffff",
    },
    ignore_filtetypes = { "git", "node_modules", "dist", "build", "target", "vendor", '.env', '.env.local' }
  }
}
