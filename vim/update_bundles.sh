BUNDLE_DIR=~/.vim/bundle

get_bundle() {
  (
  if [ -d "$1" ]; then
    echo "Updating $2's $1"
    cd "$1"
    git pull --rebase
  else
    git clone "https://github.com/$2/$1.git"
  fi
  )
}

mkdir -p $BUNDLE_DIR
cd $BUNDLE_DIR
get_bundle vim-irblack wgibbs  # ir_black color scheme
get_bundle tcomment_vim tomtom # Use cnt-_ _ to comment line or block
get_bundle vim-matchit tsaleh 
get_bundle vim-textobj-user kana 
get_bundle vim-textobj-rubyblock nelstrom 
get_bundle ctrlp.vim kien

#get_bundle Command-T wincent # requires compilation and was totally broken last time attempted
#get_bundle vim-abolish sensible
#get_bundle tabular godlygeek
#get_bundle ack.vim mileszs 
#get_bundle vim-abolish tpope 
#get_bundle vim-bufonly duff 
#get_bundle vim-endwise tpope 
#get_bundle vim-fugitive tpope 
#get_bundle vim-git tpope 
#get_bundle vim-javascript pangloss 
#get_bundle vim-json leshill 
#get_bundle vim-markdown tpope 
#get_bundle vim-pathogen tpope 
#get_bundle vim-rake tpope 
#get_bundle vim-repeat tpope 
#get_bundle vim-ruby vim-ruby
#get_bundle vim-speeddating tpope 
#get_bundle vim-surround tpope 
#get_bundle vim-vividchalk tpope 
#get_bundle vim-colors-solarized altercation
#get_bundle ctrlp.vim kien