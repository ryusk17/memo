#!/usr/bin/zsh

if [ ! -e "${ZDOTDIR:-$HOME}/.zprezto" ]; then
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
else
  echo skip git clone prezto 
fi

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

echo "source .zshrc_zprezto_local" >> ${ZDOTDIR:-$HOME}/.zshrc

DIR=`pwd`
echo $DIR
ln -s $DIR/.zshrc_zprezto_local ~/
ln -s $DIR/my_agnoster "${ZDOTDIR:-$HOME}/.zprezto/modules/prompt/external/"
sed -i -e "/zstyle ':prezto:load' pmodule /a   'syntax-highlighting' \\\\" ~/.zpreztorc
sed -i -e "/zstyle ':prezto:module:prompt' theme 'sorin'/s/^zstyle/# zstyle/g" ~/.zpreztorc
echo 'export TERM="xterm-256color"' >> ~/.zpreztorc
echo "POWERLEVEL9K_MODE='nerdfont-complete'" >> ~/.zpreztorc
echo "zstyle ':prezto:module:prompt' theme 'my_agnoster'" >> ~/.zpreztorc
ln -s $DIR/my_agnoster/my_agnoster.zsh-theme "${ZDOTDIR:-$HOME}/.zprezto/modules/prompt/functions/prompt_my_agnoster_setup"

echo $HOME
if [ ! -e "$HOME/.fzf" ]; then
  git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
  $HOME/.fzf/install
  sed -i -e "/.fzf\/shell\/completion.zsh/s/^# //g" ~/.fzf.zsh
  sed -i -e "/.fzf\/shell\/key-bindings.zsh/s/^# //g" ~/.fzf.zsh
else
  echo skip git clone fzf
fi

if [ ! -e "$HOME/enhancd" ]; then
  git clone --depth 1 https://github.com/b4b4r07/enhancd $HOME/enhancd
  chflags hidden enhancd
  # echo "source ~/enhancd/init.sh"  >> ~/.bash_profile
else
  echo skip git clone enhancd
fi

