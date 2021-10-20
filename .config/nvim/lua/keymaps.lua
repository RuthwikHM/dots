local function map(mode, lhs, rhs, opts)
  local options = {}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

--Remap leader to space
vim.g.mapleader = ' '

--Clear previous search highlighting
map('','<C-L>',':nohl<CR>',{noremap = true})
--Toggle undo tree
map('','<C-U>',':UndotreeToggle<CR>',{noremap = true,silent = true})
--Open fugitive
map('','<leader>gs',':Git<CR>',{noremap = true})
 --Easy merge conflict resolution
 --remote branch on right
map('','<leader>gj',':diffget RE<CR>',{noremap = true})
 --local branch on left
map('','<leader>gf',':diffget LO<CR>',{noremap = true})
 --Nerd Commenter remaps for change in leader
map('','<leader>ct','<plug>NERDCommenterToggle<CR>')

--Toggle tagbar
map('n','<C-t>',':TagbarToggle<CR>',{silent = true})

--Adjusting split size easier
map('','<C-Left>', ':vertical resize +3<CR>',{noremap = true,silent = true})
map('','<C-Right>', ':vertical resize -3<CR>',{noremap = true,silent = true})
map('','<C-Up>', ':resize +3<CR>',{noremap = true,silent = true})
map('','<C-Down>', ':resize -3<CR>',{noremap = true,silent = true})

-- Change 2 split windows from vert to horiz or horiz to vert
map('','<Leader>th','<C-w>t<C-w>H',{noremap = true})
map('','<Leader>tk','<C-w>t<C-w>K',{noremap = true})

-- Easy switching between panes
map('','<A-h>',':wincmd h<CR>',{noremap = true,silent = true})
map('','<A-j>',':wincmd j<CR>',{noremap = true,silent = true})
map('','<A-k>',':wincmd k<CR>',{noremap = true,silent = true})
map('','<A-l>',':wincmd l<CR>',{noremap = true,silent = true})

-- Map jk to escape in insert mode
map('i','jk','<C-[>')

-- Easy closing of panes
map('n','<A-q>','<C-w>q',{noremap = true})

-- Fix j,k keys when lines are wrapped
map('n','j','gj',{noremap = true})
map('n','k','gk',{noremap = true})

-- FZF
-- map('n','<leader>p',':Files<CR>',{noremap = true,silent = true})
-- map('n','<leader>b',':Buffers<CR>',{noremap = true,silent = true})
-- map('n','<leader>lg',':Rg<CR>',{noremap = true,silent = true})

-- nvim-compe
-- map('i','<C-Space>','compe#complete()',{silent = true,expr = true})
-- map('i','<CR>',[[compe#confirm('<CR>')]],{silent = true,expr = true})
-- map('i','<C-e>',[[compe#close('<C-e>')]],{silent = true,expr = true})
-- map('i','<C-f>',[[compe#scroll({'delta':+4})]],{silent = true,expr = true})
-- map('i','<C-d>',[[compe#scroll({'delta':-4})]],{silent = true,expr = true})

-- Telescope
-- //TODO
map('n','<leader>ff','<cmd>Telescope find_files<cr>',{noremap = true})
map('n','<leader>fg','<cmd>Telescope live_grep<cr>',{noremap = true})
map('n','<leader>fb','<cmd>Telescope buffers<cr>',{noremap = true})
map('n','<leader>fh','<cmd>Telescope help_tags<cr>',{noremap = true})
