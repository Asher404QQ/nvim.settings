return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "leoluz/nvim-dap-go",
      "rcarriga/nvim-dap-ui",      -- UI для дебаггера
      "nvim-neotest/nvim-nio",     -- зависимость dap-ui
      "williamboman/mason.nvim",   -- установщик пакетов
      "jay-babu/mason-nvim-dap.nvim" -- bridge между mason и dap
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      -- Автоустановка codelldb через mason
      require("mason-nvim-dap").setup({
        ensure_installed = { "codelldb", "delve" },
        automatic_installation = true,
      })

      require("dap-go").setup()

      -- Настройка адаптера
      local codelldb_path = vim.fn.stdpath("data") .. "/mason/bin/codelldb"
      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          command = codelldb_path,
          args = { "--port", "${port}" },
        },
      }

      -- Конфигурация для C++
      dap.configurations.cpp = {
        {
          name = "Launch file",
          type = "codelldb",
          request = "launch",
          program = function()
            -- Спрашивает путь к бинарнику перед запуском
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
        },
      }

      -- UI открывается/закрывается автоматически
      dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
      dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
      dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

      dapui.setup()

      -- Keymaps
      vim.keymap.set("n", "<F5>", dap.continue)
      vim.keymap.set("n", "<F10>", dap.step_over)
      vim.keymap.set("n", "<F11>", dap.step_into)
      vim.keymap.set("n", "<F12>", dap.step_out)
      vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
    end
  },
}
