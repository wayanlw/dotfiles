#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '


#add my scripts to the path
PATH=$PATH:~/.dotfiles/scripts

#lww Aliases file
[ -e "$HOME/.bash_aliases" ] && source "$HOME/.bash_aliases" || ln -sf "$HOME/.dotfiles/.bash_aliases" "$HOME/.bash_aliases" && source "$HOME/.bash_aliases"

# if [ -e $HOME/.bash_aliases ];then
#     source $HOME/.bash_aliases
# else
#     ln -sf "$HOME/.dotfiles/.bash_aliases" "$HOME/.bash_aliases" && source "$HOME/.bash_aliases"
# fi

[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#
# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

