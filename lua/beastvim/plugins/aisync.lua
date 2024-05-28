--[[
  Unleash seamless collaboration between AI and coding
  Effortlessly boost efficiency with plugins that adapt to your needs,
  creating a streamlined and innovative development experience.
                                        -- Aisync --
]]
local Utils = require("beastvim.utils")

return {
  -- Copilot
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = { "InsertEnter" },
    build = ":Copilot auth",
    dependencies = { "zbirenbaum/copilot-cmp" },
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
      filetypes = {
        ["*"] = true, -- disable for all other filetypes and ignore default `filetypes`
      },
    },
  },
  {
    "zbirenbaum/copilot-cmp",
    event = { "InsertEnter" },
    dependencies = { "copilot.lua" },
    opts = {},
    config = function(_, opts)
      local copilot_cmp = require("copilot_cmp")
      copilot_cmp.setup(opts)
      Utils.lsp.on_attach(function(client, _)
        if client.name == "copilot" then
          copilot_cmp._on_insert_enter()
        end
      end)
    end,
  },
}
