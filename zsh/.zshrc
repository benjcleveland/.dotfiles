autoload -Uz compinit promptinit 
compinit -i
promptinit

# vcs_info
autoload -Uz vcs_info

precmd() { vcs_info }
setopt prompt_subst
RPS1='%!${vcs_info_msg_0_}%# '

# set the prompt how I like it
prompt adam2 

alias ls="ls -G --color=auto"
# use a newer version of vim
#alias vim="/usr/local/bin/vim"

# antigen setup
#source "$HOME/.antigen/antigen.zsh"
#antigen-use oh-my-zsh
#antigen bundle https://github.com/arialdomartini/oh-my-git.git 
#antigen theme arialdomartini/oh-my-git-themes oppa-lana-style

#antigen-apply

# increase the size of the history file
SAVEHIST=4096
HISTSIZE=4096

#gvim() { command gvim --remote-silent "$@" || command gvim "$@"; }

# enable autocomplete for kubectl commands
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)

#alias 'git commit'='git commit -S'

# requires installation of fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

alias ghc="gh copilot suggest"
