mkdir -p ~/.vim/autoload ~/.vim/bundle ~/.vim/swapfiles ~/.vim/backups
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
. repos.sh
ln -s ~/vimify/.vimrc ~/.vimrc
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo "DONT FORGET THE NERD FONT! https://github.com/ryanoasis/nerd-fonts"
