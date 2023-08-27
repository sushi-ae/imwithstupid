# .zshrc

#PS1="-> "
RPROMPT="%F{yellow}$(whoami)%F{fg}"

setopt PROMPT_SUBST
PROMPT='$([[ $PWD != $HOME ]] && echo "%F{blue}%~%f ")$ '

#precmd() { print -Pn "\e]2;%~\a" }

\builtin alias cd=__zoxide_z
\builtin alias cdzi=__zoxide_zi

eval "$(zoxide init zsh)"

# other
alias ls="exa -1"
alias pls="sudo"
