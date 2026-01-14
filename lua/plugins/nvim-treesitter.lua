return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false, -- força carregar cedo
    config = function()
      local ok, ts = pcall(require, "nvim-treesitter.configs")
      if not ok then
        vim.notify("nvim-treesitter não foi carregado corretamente", vim.log.levels.ERROR)
        return
      end

      ts.setup({
        ensure_installed = { "lua", "html", "css", "javascript", "java" },
        highlight = { enable = true },
        indent = { enable = true },
      })

      vim.filetype.add({
        extension = { jsp = "html" },
      })
    end,
  },
}
