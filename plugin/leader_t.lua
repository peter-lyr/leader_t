require 'which-key'.add {
  { '<leader>t',  group = 'test', },
  { '<leader>ts', function() vim.cmd 'StartupTime' end, desc = 'StartupTime', mode = { 'n', 'v', }, },
}
