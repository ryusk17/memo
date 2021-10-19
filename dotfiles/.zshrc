# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/narieda/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="eastwood"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    zsh-autosuggestions
    zsh-256color
    )
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=167'
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=167,bg=cyan,bold,underline'
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=24'

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
alias tmux='tmux -2'

alias la='ls -lha'
alias schema='cd ~/schema/'
alias cvst='cd /var/src/toshin.narieda.local'
alias cvwt='cd /var/www/toshin.narieda.local'
alias lp1='cd /var/src/toshin.narieda.local/lp_group_1/src'
alias lp2='cd /var/src/toshin.narieda.local/lp_group_2/src'
alias lp3='cd /var/src/toshin.narieda.local/lp_group_3/src'
alias yoko='cd /var/src/toshin.narieda.local/toitsutest_chugaku_yoko/'
alias api='cd /var/src/toshin.narieda.local/toshin_api/'

alias cvsy='cd /var/src/yotsuya.narieda.local'
alias cvwy='cd /var/www/yotsuya.narieda.local'
alias ylf='cd /var/www/yotsuya.narieda.local/lform'

alias cvsi='cd /var/src/itoman.narieda.local'
alias cvwi='cd /var/www/itoman.narieda.local'

alias cvsw='cd /var/src/waseda.narieda.local'
alias cvww='cd /var/www/waseda.narieda.local'

alias v='vim'
alias e='emacs'

alias bat='/usr/local/bat/bat'

alias memo='vim ~/.mine/my-note/memo.md'
alias cmemo='cat ~/.mine/my-note/memo.md'
alias tmemo='tail ~/.mine/my-note/memo.md'

alias ohmyzsh="mate ~/.oh-my-zsh"

cd ()
{
	builtin cd "$@" && la
}

# ctrl r で peco で history 検索
function peco-history-selection() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi

    BUFFER=$(\history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-history-selection
bindkey '^r' peco-history-selection


# fc コマンドでカレントディレクトリ以下のディレクトリを絞り込んだ後に移動する
function find_cd() {
    cd "$(find . -type d | peco)"
}
alias fc="find_cd"

# fv コマンドでカレントディレクトリ以下のファイルを絞り込んだ後にvim で開く
function find_vim() {
    #vim "$(find . -type f | peco)"
    vim "$(find . -type d -name '.git' -prune -o -type f | peco)"
}
alias fv="find_vim"

# fe コマンドでカレントディレクトリ以下のファイルを絞り込んだ後に emacs で開く
function find_emacs() {
    #emacs "$(find . -type f | peco)"
    emacs "$(find . -type d -name '.git' -prune -o -type f | peco)"
}
alias fe="find_emacs"

export TERM=xterm-256color

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
