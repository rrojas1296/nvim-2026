return {
  "nvim-tree/nvim-tree.lua",
  config = function()
    local nvim_tree = require('nvim-tree')
    local on_attach = function(bufnr)
      local api = require('nvim-tree.api')
      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      api.config.mappings.default_on_attach(bufnr)

      vim.keymap.set('n', 'l', api.node.open.edit, opts('Open File'))
    end
    nvim_tree.setup({
      on_attach = on_attach,
      view = {
        width = 40
      },
      filters = {
        dotfiles = true
      }
    })
  end
}
