set nocompatible
runtime! autoload/pathogen.vim
filetype off 
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

if filereadable(expand('~/.vim/vimrc'))
  source ~/.vim/vimrc
endif
