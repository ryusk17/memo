# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
alias la='ls -la'
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

alias v='vim'
alias e='TERM=xterm-256color emacs'

alias tmux='tmux -2'

# Git ブランチ名をプロンプトに表示
source ~/.git-completion.bash
source ~/.git-prompt.sh

function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/:\1 / '
}
function promps {
    # 色は気分で変えたいかもしれないので変数宣言しておく
    local  BLUE="\[\e[1;34m\]"
    local  RED="\[\e[1;31m\]"
    local  GREEN="\[\e[0;32m\]"
    local  WHITE="\[\e[00m\]"
    local  GRAY="\[\e[1;37m\]"
    local  YELLOW="\[\e[0;33m\]"
    local  CYAN="\[\e[1;36m\]"
    local  PURPLE="\[\e[1;35m\]"

    case $TERM in
        xterm*) TITLEBAR='\[\e]0;\W\007\]';;
        *)      TITLEBAR="";;
    esac
    local BASE="\u@\h"
    PS1="${TITLEBAR}[${WHITE}${BASE}${WHITE} ${WHITE}\W${WHITE}]${GREEN}\$(parse_git_branch)${WHITE}\$${WHITE} "
}
promps
