return {
  {
    "othree/html5.vim",
    ft = { "html", "jsp" },
    config = function()
      -- Desativa autoformatação automática para arquivos JSP
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "jsp",
        callback = function()
          vim.b.autoformat = false
          vim.b.disable_autoformat = true
        end,
      })
    end,
  },
}
