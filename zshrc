source /etc/profile
source ~/.bash_profile
source ~/.bash_aliases

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="steeef"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
themes  # lsthemes to list out all theme, and theme "name" to switch
gem
bundler
extract
history-substring-search
zsh-syntax-highlighting
encode64
zaw
wd
git
zsh-autosuggestions
)

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_UPDATE="true"

source $ZSH/oh-my-zsh.sh

zstyle ':completion::approximate:' max-errors 1 numeric

export LD_LIBRARY_PATH=/usr/local/lib

# prompt ===========================================================================
function collapse_pwd {
  echo $(pwd | sed -e "s,^$HOME,~,")
}
PROMPT=$'
At %{$orange%}$(collapse_pwd)%{$reset_color%} $vcs_info_msg_0_ %{$fg[green]%}[%*]%{$reset_color%} $(virtualenv_info)%{$reset_color%}
'

# custom auto completion
# ==================================================================================
# COMPLETION SETTINGS
# add custom completion scripts
fpath=(~/.zsh/completion $fpath)

# show completion menu when number of options is at least 2
zstyle ':completion:*' menu select=2
zstyle ":completion:*:descriptions" format "%B%d%b"

autoload up-line-or-beginning-search
autoload down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# ctrl n and ctrl p
# to get the key escape sequence for up arrow, type Ctrl-v + up in terminal
# http://sa.ndropad.in/2013/03/10/changing-key-bindings-in-zsh.html
bindkey "^P" history-substring-search-up
bindkey "^N" history-substring-search-down

# alt w and alt b to move wordly
bindkey "^[w" forward-word
bindkey "^[-" backward-word

# load auto completion from bash
autoload -U compinit && compinit
autoload -U bashcompinit && bashcompinit

# https://github.com/tarruda/zsh-autosuggestions
source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

# use 256 colors terminal, try spectrum_ls to list all color

export TERM=xterm-256color

export ERL_AFLAGS="-kernel shell_history enabled"

setxkbmap -option caps:ctrl_modifier
