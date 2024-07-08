return {
  "supermaven-inc/supermaven-nvim",
  keys = {
    { "<leader>TS" },
  },
  opts = {
    color = {
      suggestion_color = "#ffffff",
    },
    ignore_filtetypes = { "git", "node_modules", "dist", "build", "target", "vendor", '.env', '.env.local' }
  }
}
