local F = require 'f'

local function test()
  F.get_cur_proj_dirs()
end

require 'which-key'.register {
  ['<leader>t'] = { name = 'test', },
  ['<leader>ts'] = { function() vim.cmd 'StartupTime' end, 'StartupTime', mode = { 'n', 'v', }, },
  ['<leader>tc'] = { function() F.nvimtree_cd(F.get_cur_file()) end, 'nvimtree_cd %:h', mode = { 'n', 'v', }, },
  ['<leader>tw'] = { function() F.nvimtree_cd(F.get_cwd()) end, 'nvimtree_cd cwd', mode = { 'n', 'v', }, },
  ['<leader>tu'] = { function() F.nvimtree_cd_sel(F.get_cur_proj_dirs()) end, 'nvimtree_cd sel', mode = { 'n', 'v', }, },
  ['<leader>to'] = { function() vim.cmd 'NvimTreeOpen' end, 'NvimTreeOpen', mode = { 'n', 'v', }, },
  ['<leader>tq'] = { function() vim.cmd 'NvimTreeClose' end, 'NvimTreeClose', mode = { 'n', 'v', }, },
  ['<leader>tp'] = { function() vim.cmd 'NvimTreeFocus' end, 'NvimTreeFocus', mode = { 'n', 'v', }, },
  ['<leader>tf'] = { function() F.nvimtree_findfile() end, 'nvimtree_findfile', mode = { 'n', 'v', }, },
  ['<leader>tt'] = { function() test() end, 'test', mode = { 'n', 'v', }, },
}
