-- add my plugins
local plugins = {
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },
  {
    "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("core.utils").load_mappings("dap")
    end
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function(_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      require("core.utils").load_mappings("dap_python")
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    ft = { "python" },
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "black",
        "debugpy",
        -- "mypy",
        "ruff",
        "pyright",
        "html-lsp",
        "css-ls",
        "stylua",
        "tailwindcss-language-server",
        "lua_language-server",
        "bash-language-server",
        "prettierd",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "python",
        "html",
        "css",
        "bash"
      },
    },
  },
  {
    "ThePrimeagen/harpoon",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      -- set keymaps
      local keymap = vim.keymap -- for conciseness

      keymap.set(
        "n",
        "<leader>o",
        "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>",
        { desc = "Mark file with harpoon" }
      )
      keymap.set(
        "n",
        "<leader>z",
        "<cmd>lua require('harpoon.mark').add_file()<cr>",
        { desc = "Mark file with harpoon" }
      )
      keymap.set(
        "n",
        "<leader>u",
        "<cmd>lua require('harpoon.ui').nav_next()<cr>",
        { desc = "Go to next harpoon mark" }
      )
      keymap.set(
        "n",
        "<leader>i",
        "<cmd>lua require('harpoon.ui').nav_prev()<cr>",
        { desc = "Go to previous harpoon mark" }
      )
      keymap.set("n", "<leader>1", "<cmd>lua require('harpoon.ui').gotoTerminal(1)<cr>", { desc = "Go to file 1" })
    end,
  }
}
return plugins
