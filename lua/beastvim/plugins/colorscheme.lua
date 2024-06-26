return {
  {
    "loctvl842/monokai-pro.nvim",
    lazy = false,
    priority = 1000,
    keys = { { "<leader>C", "<cmd>MonokaiProSelect<cr>", desc = "Select Moonokai pro filter" } },
    opts = {
      transparent_background = true,
      devicons = true,
      filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
      inc_search = "background", -- underline | background
      background_clear = {
        "nvim-tree",
        "neo-tree",
        "bufferline",
        "telescope",
        "toggleterm",
      },
      plugins = {
        bufferline = {
          underline_selected = true,
          underline_visible = false,
          underline_fill = true,
          bold = false,
        },
        indent_blankline = {
          context_highlight = "pro", -- default | pro
          context_start_underline = true,
        },
      },
    },
    config = function(_, opts)
      local monokai = require("monokai-pro")
      monokai.setup(opts)
      monokai.load()
    end,
  },
}
