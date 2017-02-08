    " Plugs
        " General Vim
            " TPope, make me a child
            Plug 'tpope/vim-fugitive'
            Plug 'tpope/vim-eunuch'
            Plug 'tpope/vim-abolish'
            "Plug 'tpope/vim-dispatch'
            Plug 'skywind3000/asyncrun.vim'
            Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle', 'NERDTreeFind'] }
            Plug 'w0rp/ale'
            Plug 'scrooloose/nerdcommenter'
            Plug 'junegunn/gv.vim'
            Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
            Plug 'junegunn/fzf.vim'
            Plug 'junegunn/vim-easy-align'
            Plug 'AndrewRadev/splitjoin.vim'
            Plug 'loremipsum'
            Plug 'majutsushi/tagbar'
            Plug 'dkprice/vim-easygrep'
            Plug 'SirVer/ultisnips'
            Plug 'vim-airline/vim-airline'
            Plug 'vim-airline/vim-airline-themes'
            Plug 'itspriddle/vim-stripper'
            Plug 'Valloric/YouCompleteMe', { 'do' : '~/.vim/plugged/YouCompleteMe/install.py  --tern-completer' } "--gocode-completer
            Plug 'Raimondi/delimitMate'
            Plug 'airblade/vim-gitgutter'
            Plug 'editorconfig/editorconfig-vim'
            Plug 'moorereason/vim-markdownfmt', { 'for' : 'markdown' }
            Plug 'idanarye/vim-merginal'
        " General Vim end

        " Color Schemes
            Plug 'altercation/vim-colors-solarized'
        " Color Schemes end

        " Python
            Plug 'jmcantrell/vim-virtualenv', { 'for': ['python', 'markdown'] }
        " Python end

        " Web (generic)
            Plug 'hail2u/vim-css3-syntax', { 'for' : ['css', 'markdown'] }
            Plug 'juvenn/mustache.vim', { 'for' : ['mustache', 'markdown'] }
            Plug 'digitaltoad/vim-jade', { 'for' : ['jade', 'markdown'] }
            Plug 'wavded/vim-stylus', { 'for': ['stylus', 'markdown'] }
            Plug 'rstacruz/vim-ultisnips-css', { 'for' : 'css' }

"            Plug 'csscomb/vim-csscomb'
        " Web (generic) end

        " Javascript / node / coffeescript / typescript
            Plug 'leafgarland/typescript-vim', { 'for' : ['typescript', 'markdown'] }
            Plug 'moll/vim-node', { 'for' : ['javascript', 'json', 'markdown'] }
            Plug 'kchmck/vim-coffee-script', { 'for' : ['coffee', 'coffeescript', 'markdown'] }
            Plug 'isRuslan/vim-es6', { 'for' : ['javascript', 'json', 'markdown'] }
            Plug 'grvcoelho/vim-javascript-snippets', { 'for' : ['javascript', 'json', 'markdown'] }
        " Javascript / node /coffeescript end

        " Go
            Plug 'fatih/vim-go', { 'for' : ['go', 'markdown'] }
            Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh', 'for' : ['go', 'markdown'] }
            Plug 'jodosha/vim-godebug', { 'for' : ['go'] }

        " Go

        " Scala
            Plug 'derekwyatt/vim-scala', { 'for' : 'scala' }
        " Scala End

        " Misc
            Plug 'Glench/Vim-Jinja2-Syntax', { 'for': ['jinja', 'jinja2']}
            Plug 'honza/vim-snippets'
            Plug 'vim-scripts/nginx.vim', { 'for': ['nginx', 'markdown'] }
            Plug 'tmux-plugins/vim-tmux', { 'for': ['tmux', 'markdown'] }
            Plug 'pearofducks/ansible-vim', { 'for' : ['yaml', 'ansible', 'markdown'] }
            Plug 'sotte/presenting.vim', { 'for' : ['markdown'] }
            Plug 'ekalinin/Dockerfile.vim' , {'for': ['Dockerfile', 'markdown']}
            Plug 'robbles/logstash.vim'
        " Misc end
    " Plugs end

