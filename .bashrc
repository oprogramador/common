#!/bin/bash

export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"

export PS1="\[\033[38;5;76m\]\u@\h\[$(tput sgr0)\]\[\033[38;5;39m\]-code: \$?-\[$(tput sgr0)\]\[\033[38;5;198m\]\t\[$(tput sgr0)\]\W>\[$(tput sgr0)\]\[\033[38;5;39m\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\[\033[38;5;39m\]\$\[\033[0;0;255m\]"

export GREP_OPTIONS='--color=always'
export GREP_COLOR='1;35;40'
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
source $HOME/.nvm/nvm.sh
