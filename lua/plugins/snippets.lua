return {
  {
    "L3MON4D3/LuaSnip", -- motor de snippets
    version = "v2.*", -- use a versão estável
    build = "make install_jsregexp", -- para regex avançado nos snippets
    dependencies = {
      "rafamadriz/friendly-snippets", -- coleção enorme
    },
    config = function()
      local luasnip = require("luasnip")
      require("luasnip.loaders.from_vscode").lazy_load() -- carrega friendly-snippets

      -- atalhos úteis
      vim.keymap.set({ "i", "s" }, "<C-k>", function()
        luasnip.expand_or_jump()
      end, { silent = true })
      vim.keymap.set({ "i", "s" }, "<C-j>", function()
        luasnip.jump(-1)
      end, { silent = true })
    end,
  },
}
