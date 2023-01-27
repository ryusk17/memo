
FILE_PATH=$0
if [ ! -e $FILE_PATH ]; then
    echo "Not found: $FILE_PATH"
    exit 1
fi
cd `dirname $FILE_PATH`
DIR=`pwd`

echo $DIR

ln -s $DIR/.vimrc ~/
ln -s $DIR/vimfiles/ ~/
cp $DIR/.vimrc_local_linux ~/

mkdir ~/.config/
mkdir ~/.config/nvim
ln -s $DIR/.vimrc ~/.config/nvim/init.vim
ln -s $DIR/vimfiles/ ~/.config/nvim/
#cp $DIR/.vimrc_local_linux ~/.config/nvim
