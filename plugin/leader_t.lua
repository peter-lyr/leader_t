local F = require 'f'

F.aucmd('BufEnter', 'enter term', {
  callback = function(ev)
    if not vim.g.term_total or vim.g.term_total > 0 then
      F.cd_term_cwd(ev.file)
    end
  end,
})

local function test()
  -- print('---------', string.match('bytes: 1, cols: 16', '^bytes: (%d+),'))
  -- print('---------', string.match('bytes: 1, cols: 16', ', cols: (%d+)$'))

  -- F.open_term_sel()
  -- F.notify(vim.inspect(vim.bo[vim.fn.bufnr()].expandtab))

  -- F.notify(F.get_opened_projs_files())
  -- F.opened_proj_sel()

  -- F.list_buf_info()

  -- F.print(F.get_term_bufs())
  -- F.jump_or_split_term()

  -- F.git_pull_recursive_do([[C:\Users\llydr\org-test-1]])

  -- F.notifications_buffer()

  -- F.just_run_in_term({
  --   'cd', '/d', Home, '&&',
  --   'cd', '/d', 'org-test-3', '&&',
  --   'python', F.join_path(Org, 'data', 'p', '002-python', '017-在一个仓库内从叶子模块到根部依次更新.py')
  -- })

  -- F.source()

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
  ['<leader>t<leader>'] = { name = 'test.more', },

  ['<leader>t<leader>w'] = { name = 'test.work', },
  ['<leader>t<leader>ws'] = { function() F.save_sessions_at_cwd() end, 'save_sessions_at_cwd', mode = { 'n', 'v', }, },
  ['<leader>t<leader>wl'] = { function() F.load_sessions_sel() end, 'load_sessions_sel', mode = { 'n', 'v', }, },

  ['<leader>t<leader>b'] = { name = 'test.curbuf', },
  ['<leader>t<leader>bc'] = { function() F.copy_to_desktop { F.get_cur_file(), } end, 'curfile copy_to_desktop', mode = { 'n', 'v', }, },
  ['<leader>t<leader>bd'] = { function() F.delete_from_desktop { F.get_cur_file(), } end, 'curfile delete_from_desktop', mode = { 'n', 'v', }, },

  ['<leader>tS'] = { function() vim.cmd 'StartupTime' end, 'StartupTime', mode = { 'n', 'v', }, },

  ['<leader>tc'] = { function() F.nvimtree_cd(F.get_cur_file()) end, 'nvimtree_cd %:h', mode = { 'n', 'v', }, },
  ['<leader>tw'] = { function() F.nvimtree_cd(F.get_cwd()) end, 'nvimtree_cd cwd', mode = { 'n', 'v', }, },
  ['<leader>tu'] = { function() F.nvimtree_cd_sel(F.get_cur_proj_dirs()) end, 'nvimtree_cd sel', mode = { 'n', 'v', }, },
  ['<leader>t<leader>u'] = { function() F.nvimtree_cd_sel_DIRS() end, 'nvimtree_cd sel DIRS', mode = { 'n', 'v', }, },
  ['<leader>to'] = { function() vim.cmd 'NvimTreeOpen' end, 'NvimTreeOpen', mode = { 'n', 'v', }, },
  ['<leader>tq'] = { function() vim.cmd 'NvimTreeClose' end, 'NvimTreeClose', mode = { 'n', 'v', }, },
  ['<leader>tp'] = { function() vim.cmd 'NvimTreeFocus' end, 'NvimTreeFocus', mode = { 'n', 'v', }, },
  ['<leader>td'] = { function() F.nvimtree_findfile() end, 'nvimtree_findfile', mode = { 'n', 'v', }, },
  ['<leader>tf'] = { function() vim.cmd 'NvimTreeFindFile' end, 'nvimtree_findfile_just_update', mode = { 'n', 'v', }, },

  ['<leader>tn'] = { name = 'nvim-qt start', },
  ['<leader>tnc'] = { function() F.start_nvim_qt(F.get_cur_file()) end, 'start_nvim_qt cur', mode = { 'n', 'v', }, },
  ['<leader>tnn'] = { function() F.start_nvim_qt() end, 'start_nvim_qt', mode = { 'n', 'v', }, },
  ['<leader>tns'] = { function() F.start_nvim_qt 'session' end, 'start_nvim_qt session', mode = { 'n', 'v', }, },
  ['<leader>tn<leader>s'] = { function() F.start_nvim_qt 'session!' end, 'start_nvim_qt session!', mode = { 'n', 'v', }, },
  ['<leader>tnq'] = { function() vim.cmd 'qa!' end, 'qa!', mode = { 'n', 'v', }, },

  ['<leader>tr'] = { name = 'nvim-qt restart', },
  ['<leader>trc'] = { function() F.restart_nvim_qt(F.get_cur_file()) end, 'restart_nvim_qt cur', mode = { 'n', 'v', }, },
  ['<leader>trn'] = { function() F.restart_nvim_qt() end, 'restart_nvim_qt', mode = { 'n', 'v', }, },
  ['<leader>trs'] = { function() F.restart_nvim_qt 'session' end, 'restart_nvim_qt session', mode = { 'n', 'v', }, },
  ['<leader>tr<leader>s'] = { function() F.restart_nvim_qt 'session!' end, 'restart_nvim_qt session!', mode = { 'n', 'v', }, },
  ['<leader>trq'] = { function() vim.cmd 'qa!' end, 'qa!', mode = { 'n', 'v', }, },

  ['<leader>tb'] = { name = 'output buffer', },
  ['<leader>tbn'] = { function() F.notifications_buffer() end, 'notifications_buffer', mode = { 'n', 'v', }, },
  ['<leader>tbm'] = { function() F.message_buffer() end, 'message_buffer', mode = { 'n', 'v', }, },

  ['<leader>tt'] = { function() test() end, 'test', mode = { 'n', 'v', }, },
  ['<leader>ts'] = { function() F.source() end, 'source_cur', mode = { 'n', 'v', }, },
  ['<leader>t<c-l>'] = { function() vim.cmd 'mes clear' end, 'mes clear', mode = { 'n', 'v', }, },
  ['<leader>t<c-i>'] = { function() F.list_buf_info() end, 'list_buf_info', mode = { 'n', 'v', }, },

  ['<leader>te'] = { function() F.open_term_sel() end, 'open_term_sel', mode = { 'n', 'v', }, },

  ['<leader>ta'] = { name = 'add', },
  ['<leader>tai'] = { function() F.title_cur_line() end, 'title_cur_line', mode = { 'n', 'v', }, },
  ['<leader>tad'] = { function() F.mkdir_cur_tail() end, 'mkdir_cur_tail', mode = { 'n', 'v', }, },

  ['<localleader>t'] = { name = 'toggle', },
  ['<localleader>td'] = { function() F.toggle_local 'diff' end, 'toggle_diff', mode = { 'n', 'v', }, },
  ['<localleader>tw'] = { function() F.toggle_local 'wrap' end, 'toggle_wrap', mode = { 'n', 'v', }, },
  ['<localleader>tb'] = { function() F.toggle_winbar() end, 'toggle_winbar', mode = { 'n', 'v', }, },
  ['<localleader>t<leader>b'] = { function() F.toggle_vim_g_winbar() end, 'toggle_vim_g_winbar', mode = { 'n', 'v', }, },
}

F.lazy_load 'todo_dial'

require 'which-key'.register {
  [']t'] = { function() require 'todo-comments'.jump_next() end, 'Next todo comment', mode = { 'n', 'v', }, silent = true, },
  ['[t'] = { function() require 'todo-comments'.jump_prev() end, 'Prev todo comment', mode = { 'n', 'v', }, silent = true, },
  ['<localleader><leader>t'] = { name = 'todo', },
  ['<localleader><leader>tt'] = { name = 'todo.telescope', },
  ['<localleader><leader>tta'] = { function() F.todo_telescope() end, 'TodoTelescope ALL', mode = { 'n', 'v', }, silent = true, },
  ['<localleader><leader>ttf'] = { function() F.todo_telescope 'FIX' end, 'TodoTelescope  FIX', mode = { 'n', 'v', }, silent = true, },
  ['<localleader><leader>ttd'] = { function() F.todo_telescope 'TODO' end, 'TodoTelescope TODO', mode = { 'n', 'v', }, silent = true, },
  ['<localleader><leader>tth'] = { function() F.todo_telescope 'HACK' end, 'TodoTelescope HACK', mode = { 'n', 'v', }, silent = true, },
  ['<localleader><leader>ttw'] = { function() F.todo_telescope 'WARN' end, 'TodoTelescope WARN', mode = { 'n', 'v', }, silent = true, },
  ['<localleader><leader>ttp'] = { function() F.todo_telescope 'PERF' end, 'TodoTelescope PERF', mode = { 'n', 'v', }, silent = true, },
  ['<localleader><leader>ttn'] = { function() F.todo_telescope 'NOTE' end, 'TodoTelescope NOTE', mode = { 'n', 'v', }, silent = true, },
  ['<localleader><leader>ttt'] = { function() F.todo_telescope 'TEST' end, 'TodoTelescope TEST', mode = { 'n', 'v', }, silent = true, },
  ['<localleader><leader>tt<leader>'] = { name = 'todo.telescope.done', },
  ['<localleader><leader>tt<leader>a'] = { function() F.todo_telescope() end, 'TodoTelescope  ALLDONE', mode = { 'n', 'v', }, silent = true, },
  ['<localleader><leader>tt<leader>f'] = { function() F.todo_telescope 'FIXDONE' end, 'TodoTelescope  FIXDONE', mode = { 'n', 'v', }, silent = true, },
  ['<localleader><leader>tt<leader>d'] = { function() F.todo_telescope 'TODODONE' end, 'TodoTelescope TODODONE', mode = { 'n', 'v', }, silent = true, },
  ['<localleader><leader>tt<leader>h'] = { function() F.todo_telescope 'HACKDONE' end, 'TodoTelescope HACKDONE', mode = { 'n', 'v', }, silent = true, },
  ['<localleader><leader>tt<leader>w'] = { function() F.todo_telescope 'WARNDONE' end, 'TodoTelescope WARNDONE', mode = { 'n', 'v', }, silent = true, },
  ['<localleader><leader>tt<leader>p'] = { function() F.todo_telescope 'PERFDONE' end, 'TodoTelescope PERFDONE', mode = { 'n', 'v', }, silent = true, },
  ['<localleader><leader>tt<leader>n'] = { function() F.todo_telescope 'NOTEDONE' end, 'TodoTelescope NOTEDONE', mode = { 'n', 'v', }, silent = true, },
  ['<localleader><leader>tt<leader>t'] = { function() F.todo_telescope 'TESTDONE' end, 'TodoTelescope TESTDONE', mode = { 'n', 'v', }, silent = true, },
  ['<localleader><leader>tq'] = { name = 'todo.quickfix', },
  ['<localleader><leader>tqa'] = { function() F.todo_quickfix() end, 'TodoQuickFix  All', mode = { 'n', 'v', }, silent = true, },
  ['<localleader><leader>tqf'] = { function() F.todo_quickfix 'FIX' end, 'TodoQuickFix  FIX', mode = { 'n', 'v', }, silent = true, },
  ['<localleader><leader>tqd'] = { function() F.todo_quickfix 'TODO' end, 'TodoQuickFix TODO', mode = { 'n', 'v', }, silent = true, },
  ['<localleader><leader>tqh'] = { function() F.todo_quickfix 'HACK' end, 'TodoQuickFix HACK', mode = { 'n', 'v', }, silent = true, },
  ['<localleader><leader>tqw'] = { function() F.todo_quickfix 'WARN' end, 'TodoQuickFix WARN', mode = { 'n', 'v', }, silent = true, },
  ['<localleader><leader>tqp'] = { function() F.todo_quickfix 'PERF' end, 'TodoQuickFix PERF', mode = { 'n', 'v', }, silent = true, },
  ['<localleader><leader>tqn'] = { function() F.todo_quickfix 'NOTE' end, 'TodoQuickFix NOTE', mode = { 'n', 'v', }, silent = true, },
  ['<localleader><leader>tqt'] = { function() F.todo_quickfix 'TEST' end, 'TodoQuickFix TEST', mode = { 'n', 'v', }, silent = true, },
  ['<localleader><leader>tq<leader>'] = { name = 'todo.quickfix.done', },
  ['<localleader><leader>tq<leader>a'] = { function() F.todo_quickfix() end, 'TodoQuickfix  AllDONE', mode = { 'n', 'v', }, silent = true, },
  ['<localleader><leader>tq<leader>f'] = { function() F.todo_quickfix 'FIXDONE' end, 'TodoQuickfix  FIXDONE', mode = { 'n', 'v', }, silent = true, },
  ['<localleader><leader>tq<leader>d'] = { function() F.todo_quickfix 'TODODONE' end, 'TodoQuickfix TODODONE', mode = { 'n', 'v', }, silent = true, },
  ['<localleader><leader>tq<leader>h'] = { function() F.todo_quickfix 'HACKDONE' end, 'TodoQuickfix HACKDONE', mode = { 'n', 'v', }, silent = true, },
  ['<localleader><leader>tq<leader>w'] = { function() F.todo_quickfix 'WARNDONE' end, 'TodoQuickfix WARNDONE', mode = { 'n', 'v', }, silent = true, },
  ['<localleader><leader>tq<leader>p'] = { function() F.todo_quickfix 'PERFDONE' end, 'TodoQuickfix PERFDONE', mode = { 'n', 'v', }, silent = true, },
  ['<localleader><leader>tq<leader>n'] = { function() F.todo_quickfix 'NOTEDONE' end, 'TodoQuickfix NOTEDONE', mode = { 'n', 'v', }, silent = true, },
  ['<localleader><leader>tq<leader>t'] = { function() F.todo_quickfix 'TESTDONE' end, 'TodoQuickfix TESTDONE', mode = { 'n', 'v', }, silent = true, },
}

require 'which-key'.register {
  ['<localleader><leader>t<leader>'] = { name = 'todo', },
  ['<localleader><leader>t<leader>t'] = { name = 'todo.telescope', },
  ['<localleader><leader>t<leader>ta'] = { function() F.todo_telescope_sel(F.get_file_parents()) end, 'TodoTelescope ALL', mode = { 'n', 'v', }, silent = true, },
  ['<localleader><leader>t<leader>tf'] = { function() F.todo_telescope_sel(F.get_file_parents(), 'FIX') end, 'TodoTelescope  FIX', mode = { 'n', 'v', }, silent = true, },
  ['<localleader><leader>t<leader>td'] = { function() F.todo_telescope_sel(F.get_file_parents(), 'TODO') end, 'TodoTelescope TODO', mode = { 'n', 'v', }, silent = true, },
  ['<localleader><leader>t<leader>th'] = { function() F.todo_telescope_sel(F.get_file_parents(), 'HACK') end, 'TodoTelescope HACK', mode = { 'n', 'v', }, silent = true, },
  ['<localleader><leader>t<leader>tw'] = { function() F.todo_telescope_sel(F.get_file_parents(), 'WARN') end, 'TodoTelescope WARN', mode = { 'n', 'v', }, silent = true, },
  ['<localleader><leader>t<leader>tp'] = { function() F.todo_telescope_sel(F.get_file_parents(), 'PERF') end, 'TodoTelescope PERF', mode = { 'n', 'v', }, silent = true, },
  ['<localleader><leader>t<leader>tn'] = { function() F.todo_telescope_sel(F.get_file_parents(), 'NOTE') end, 'TodoTelescope NOTE', mode = { 'n', 'v', }, silent = true, },
  ['<localleader><leader>t<leader>tt'] = { function() F.todo_telescope_sel(F.get_file_parents(), 'TEST') end, 'TodoTelescope TEST', mode = { 'n', 'v', }, silent = true, },
  ['<localleader><leader>t<leader>t<leader>'] = { name = 'todo.telescope.done', },
  ['<localleader><leader>t<leader>t<leader>a'] = { function() F.todo_telescope_sel(F.get_file_parents()) end, 'TodoTelescope  ALLDONE', mode = { 'n', 'v', }, silent = true, },
  ['<localleader><leader>t<leader>t<leader>f'] = { function() F.todo_telescope_sel(F.get_file_parents(), 'FIXDONE') end, 'TodoTelescope  FIXDONE', mode = { 'n', 'v', }, silent = true, },
  ['<localleader><leader>t<leader>t<leader>d'] = { function() F.todo_telescope_sel(F.get_file_parents(), 'TODODONE') end, 'TodoTelescope TODODONE', mode = { 'n', 'v', }, silent = true, },
  ['<localleader><leader>t<leader>t<leader>h'] = { function() F.todo_telescope_sel(F.get_file_parents(), 'HACKDONE') end, 'TodoTelescope HACKDONE', mode = { 'n', 'v', }, silent = true, },
  ['<localleader><leader>t<leader>t<leader>w'] = { function() F.todo_telescope_sel(F.get_file_parents(), 'WARNDONE') end, 'TodoTelescope WARNDONE', mode = { 'n', 'v', }, silent = true, },
  ['<localleader><leader>t<leader>t<leader>p'] = { function() F.todo_telescope_sel(F.get_file_parents(), 'PERFDONE') end, 'TodoTelescope PERFDONE', mode = { 'n', 'v', }, silent = true, },
  ['<localleader><leader>t<leader>t<leader>n'] = { function() F.todo_telescope_sel(F.get_file_parents(), 'NOTEDONE') end, 'TodoTelescope NOTEDONE', mode = { 'n', 'v', }, silent = true, },
  ['<localleader><leader>t<leader>t<leader>t'] = { function() F.todo_telescope_sel(F.get_file_parents(), 'TESTDONE') end, 'TodoTelescope TESTDONE', mode = { 'n', 'v', }, silent = true, },
  ['<localleader><leader>t<leader>q'] = { name = 'todo.quickfix', },
  ['<localleader><leader>t<leader>qa'] = { function() F.todo_quickfix_sel(F.get_file_parents()) end, 'TodoQuickFix  All', mode = { 'n', 'v', }, silent = true, },
  ['<localleader><leader>t<leader>qf'] = { function() F.todo_quickfix_sel(F.get_file_parents(), 'FIX') end, 'TodoQuickFix  FIX', mode = { 'n', 'v', }, silent = true, },
  ['<localleader><leader>t<leader>qd'] = { function() F.todo_quickfix_sel(F.get_file_parents(), 'TODO') end, 'TodoQuickFix TODO', mode = { 'n', 'v', }, silent = true, },
  ['<localleader><leader>t<leader>qh'] = { function() F.todo_quickfix_sel(F.get_file_parents(), 'HACK') end, 'TodoQuickFix HACK', mode = { 'n', 'v', }, silent = true, },
  ['<localleader><leader>t<leader>qw'] = { function() F.todo_quickfix_sel(F.get_file_parents(), 'WARN') end, 'TodoQuickFix WARN', mode = { 'n', 'v', }, silent = true, },
  ['<localleader><leader>t<leader>qp'] = { function() F.todo_quickfix_sel(F.get_file_parents(), 'PERF') end, 'TodoQuickFix PERF', mode = { 'n', 'v', }, silent = true, },
  ['<localleader><leader>t<leader>qn'] = { function() F.todo_quickfix_sel(F.get_file_parents(), 'NOTE') end, 'TodoQuickFix NOTE', mode = { 'n', 'v', }, silent = true, },
  ['<localleader><leader>t<leader>qt'] = { function() F.todo_quickfix_sel(F.get_file_parents(), 'TEST') end, 'TodoQuickFix TEST', mode = { 'n', 'v', }, silent = true, },
  ['<localleader><leader>t<leader>q<leader>'] = { name = 'todo.quickfix.done', },
  ['<localleader><leader>t<leader>q<leader>a'] = { function() F.todo_quickfix_sel(F.get_file_parents()) end, 'TodoQuickfix  AllDONE', mode = { 'n', 'v', }, silent = true, },
  ['<localleader><leader>t<leader>q<leader>f'] = { function() F.todo_quickfix_sel(F.get_file_parents(), 'FIXDONE') end, 'TodoQuickfix  FIXDONE', mode = { 'n', 'v', }, silent = true, },
  ['<localleader><leader>t<leader>q<leader>d'] = { function() F.todo_quickfix_sel(F.get_file_parents(), 'TODODONE') end, 'TodoQuickfix TODODONE', mode = { 'n', 'v', }, silent = true, },
  ['<localleader><leader>t<leader>q<leader>h'] = { function() F.todo_quickfix_sel(F.get_file_parents(), 'HACKDONE') end, 'TodoQuickfix HACKDONE', mode = { 'n', 'v', }, silent = true, },
  ['<localleader><leader>t<leader>q<leader>w'] = { function() F.todo_quickfix_sel(F.get_file_parents(), 'WARNDONE') end, 'TodoQuickfix WARNDONE', mode = { 'n', 'v', }, silent = true, },
  ['<localleader><leader>t<leader>q<leader>p'] = { function() F.todo_quickfix_sel(F.get_file_parents(), 'PERFDONE') end, 'TodoQuickfix PERFDONE', mode = { 'n', 'v', }, silent = true, },
  ['<localleader><leader>t<leader>q<leader>n'] = { function() F.todo_quickfix_sel(F.get_file_parents(), 'NOTEDONE') end, 'TodoQuickfix NOTEDONE', mode = { 'n', 'v', }, silent = true, },
  ['<localleader><leader>t<leader>q<leader>t'] = { function() F.todo_quickfix_sel(F.get_file_parents(), 'TESTDONE') end, 'TodoQuickfix TESTDONE', mode = { 'n', 'v', }, silent = true, },
}

require 'which-key'.register {
  -- ['<localleader>ts'] = { function() F.toggle_statusline() end, 'toggle_statusline', mode = { 'n', 'v', }, },
}
