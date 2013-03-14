" TODO: display warning if either of the following file cannot be found

if filereadable(expand('~/.vim/autoload/pathogen.vim'))
  runtime! autoload/pathogen.vim
  filetype off 
  call pathogen#helptags()
  call pathogen#runtime_append_all_bundles()
endif

if filereadable(expand('~/.vim/vimrc'))
  source ~/.vim/vimrc
endif
