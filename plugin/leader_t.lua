require 'which-key'.register {
  ['<leader>t'] = { name = 'test', },
  ['<leader>ts'] = { function() vim.cmd 'StartupTime' end, 'StartupTime', mode = { 'n', 'v', }, },
}
