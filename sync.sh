mkdir -p ~/.vim/autoload ~/.vim/bundle ~/.vim/swapfiles ~/.vim/backups
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
. repos.sh
ln -s ~/vimify/.vimrc ~/.vimrc
echo "DONT FORGET THE NERD FONT! https://github.com/ryanoasis/nerd-fonts"
