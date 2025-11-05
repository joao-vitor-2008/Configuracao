-- ~/.config/nvim/lua/plugins/java.lua
return {
  {
    "mfussenegger/nvim-jdtls",
    ft = { "java, jsp" }, -- só carrega quando abrir arquivos Java
    dependencies = {
      "mason-org/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
      -- A config real do jdtls está em ftplugin/java.lua
      -- Aqui só inicializamos mason e garantimos os pacotes
      require("mason").setup()
      require("mason-lspconfig").setup()
      require("mason-tool-installer").setup({
        ensure_installed = {
          "jdtls", -- Java LSP
          "java-debug-adapter",
          "java-test",
        },
      })
    end,
  },
}
