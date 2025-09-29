-- Extend NvChad telescope config with ui-select
local nvchad_config = require "nvchad.configs.telescope"

- Add ui-select to extensions
nvchad_config.extensions = nvchad_config.extensions or {}
nvchad_config.extensions["ui-select"] = {
  require("telescope.themes").get_dropdown {
    winblend = 10,
    border = true,
    previewer = false,
    shorten_path = false,
    layout_config = {
      width = 0.8,
      height = 0.9,
    }
  }
}

-- Add ui-select to extensions list
nvchad_config.extensions_list = nvchad_config.extensions_list or {}
table.insert(nvchad_config.extensions_list, "ui-select")

-- Ensure telescope setup includes ui-select
vim.schedule(function()
  if pcall(require, "telescope") then
    require("telescope").setup(nvchad_config)
    if pcall(require, "telescope._extensions.ui-select") then
      require("telescope").load_extension("ui-select")
    end
  end
end)

return nvchad_config
