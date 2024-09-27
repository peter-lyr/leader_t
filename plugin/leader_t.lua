local F = require 'f'

local function test()
  -- F.git_pull_recursive_do([[C:\Users\llydr\org-test-1]])

  -- F.notifications_buffer()

  -- F.just_run_in_term({
  --   'cd', '/d', Home, '&&',
  --   'cd', '/d', 'org-test-3', '&&',
  --   'python', F.join_path(Org, 'data', 'p', '002-python', '017-在一个仓库内从叶子模块到根部依次更新.py')
  -- })

  -- F.source_cur()

  -- F.run_outside { 'pip', 'install', 'bitstring', '-i', 'https://pypi.tuna.tsinghua.edu.cn/simple', '--trusted-host', 'mirrors.aliyun.com', }

  -- F.delete_folder(Home .. '\\org-test')
  -- F.clone_if_not_exist('org-test', 'org')

  -- F.set_timeout(1000, function()
  --   vim.notify('--------------')
  -- end)
  -- vim.ui.input({ prompt = '>' }, function(input)
  --   print(input)
  -- end)
end

require 'which-key'.register {
  ['<leader>t'] = { name = 'test', },

  ['<leader>tS'] = { function() vim.cmd 'StartupTime' end, 'StartupTime', mode = { 'n', 'v', }, },

  ['<leader>tc'] = { function() F.nvimtree_cd(F.get_cur_file()) end, 'nvimtree_cd %:h', mode = { 'n', 'v', }, },
  ['<leader>tw'] = { function() F.nvimtree_cd(F.get_cwd()) end, 'nvimtree_cd cwd', mode = { 'n', 'v', }, },
  ['<leader>tu'] = { function() F.nvimtree_cd_sel(F.get_cur_proj_dirs()) end, 'nvimtree_cd sel', mode = { 'n', 'v', }, },
  ['<leader>to'] = { function() vim.cmd 'NvimTreeOpen' end, 'NvimTreeOpen', mode = { 'n', 'v', }, },
  ['<leader>tq'] = { function() vim.cmd 'NvimTreeClose' end, 'NvimTreeClose', mode = { 'n', 'v', }, },
  ['<leader>tp'] = { function() vim.cmd 'NvimTreeFocus' end, 'NvimTreeFocus', mode = { 'n', 'v', }, },
  ['<leader>td'] = { function() F.nvimtree_findfile() end, 'nvimtree_findfile', mode = { 'n', 'v', }, },
  ['<leader>tf'] = { function() vim.cmd 'NvimTreeFindFile' end, 'nvimtree_findfile_just_update', mode = { 'n', 'v', }, },

  ['<leader>tn'] = { name = 'nvim-qt start', },
  ['<leader>tnc'] = { function() F.start_nvim_qt(F.get_cur_file()) end, 'start_nvim_qt cur', mode = { 'n', 'v', }, },
  ['<leader>tnn'] = { function() F.start_nvim_qt() end, 'start_nvim_qt', mode = { 'n', 'v', }, },
  ['<leader>tnq'] = { function() vim.cmd 'qa!' end, 'qa!', mode = { 'n', 'v', }, },

  ['<leader>tr'] = { name = 'nvim-qt restart', },
  ['<leader>trc'] = { function() F.restart_nvim_qt(F.get_cur_file()) end, 'restart_nvim_qt cur', mode = { 'n', 'v', }, },
  ['<leader>trn'] = { function() F.restart_nvim_qt() end, 'restart_nvim_qt', mode = { 'n', 'v', }, },

  ['<leader>tb'] = { name = 'output buffer', },
  ['<leader>tbn'] = { function() F.notifications_buffer() end, 'notifications_buffer', mode = { 'n', 'v', }, },

  ['<leader>tt'] = { function() test() end, 'test', mode = { 'n', 'v', }, },
  ['<leader>ts'] = { function() F.source_cur() end, 'source_cur', mode = { 'n', 'v', }, },
}
