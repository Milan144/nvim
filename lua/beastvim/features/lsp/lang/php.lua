local config = require("plugins.configs.lspconfig")
local on_attach = config.on_attach
local capabilities = config.capabilities
local lspconfig = require("lspconfig")

lspconfig.phpactor.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"php"},
})

require('lint').linters_by_ft = {
  php = {'phpstan'},
}

return {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "phpactor",
        "phpstan",
      }
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function ()
          opts = require "plugins.configs.treesitter"
          opts.ensure_installed = {
            "php",
          }
          return opts
        end
      },
}
