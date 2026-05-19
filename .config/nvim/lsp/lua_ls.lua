return {
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      workspace = {
        checkThirdParty = false,
      },
      diagnostics = {
        globals = { "vim" },
      },
      telemetry = { enable = false },
    },
  },
}
