-- Default project.nvim configuration.
require("project_nvim").setup{manual_mode=true}

-- Add project.nvim extension to telescope.
require('telescope').load_extension('projects')

-- Configure nvim.tree for project.nvim.
require("nvim-tree").setup{
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = true
  }
}

-- Alywas open nvim.tree.
local function open_nvim_tree()
  require("nvim-tree.api").tree.open()
end
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

-- Alywas open nvim.tree.
require("toggleterm").setup()
