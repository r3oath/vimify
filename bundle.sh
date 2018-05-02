rm repos.sh
touch repos.sh

cd ~/.vim/bundle/

for dir in */
do
    dir=${dir%*/}
    (cd $dir; echo "git clone `git remote get-url origin` ~/.vim/bundle/${dir}" >> ~/vimify/repos.sh)
done
