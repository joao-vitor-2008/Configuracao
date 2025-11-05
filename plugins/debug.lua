return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio", -- 🔹 dependência necessária
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()

      -- Abre e fecha UI automaticamente
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      -- Atalhos de debug
      local map = vim.keymap.set
      map("n", "<C-b>", function()
        dap.toggle_breakpoint()
      end, { desc = "Alternar breakpoint" })
      map("n", "<C-d>", function()
        dap.continue()
      end, { desc = "Iniciar/Continuar debug" })
      map("n", "<C-n>", function()
        dap.step_over()
      end, { desc = "Step over" })
      map("n", "<C-i>", function()
        dap.step_into()
      end, { desc = "Step into" })
      map("n", "<C-o>", function()
        dap.step_out()
      end, { desc = "Step out" })
      map("n", "<C-u>", function()
        dapui.toggle()
      end, { desc = "Alternar UI do DAP" })
    end,
  },
}
