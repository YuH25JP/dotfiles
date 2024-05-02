return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use {'neoclide/coc.nvim', branch='release'}
    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'
    use 'rebelot/kanagawa.nvim'
    use 'ryanoasis/vim-devicons'
    use 'cohama/lexima.vim'
    use 'tpope/vim-surround'
    use 'tpope/vim-fugitive'

    use 'nvim-lua/plenary.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
end)
